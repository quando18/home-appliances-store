import React, { useState, useEffect } from 'react';
import { useParams, Link, useNavigate } from 'react-router-dom';
import {Container, Row, Col, Button, Badge, Form, ProgressBar, Nav, Breadcrumb} from 'react-bootstrap';
import {FaStar, FaRegStar, FaTruck, FaShieldAlt, FaExchangeAlt, FaStarHalfAlt, FaMinus, FaPlus} from 'react-icons/fa';
import { useDispatch } from 'react-redux';
import { addToCart } from '../../../redux/slices/cartSlice';
import apiProductService from '../../../api/apiProductService';
import {formatPrice, renderStarsItem, createSlug} from '../../../helpers/formatters';
import '../style/ProductDetail.css';
import apiVoteService from "../../../api/apiVoteService";
import { toast, ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

const DashboardVoteProduct = React.lazy(() => import('../../components/vote/DashboardVoteProduct'));
const RelatedProducts = React.lazy(() => import('../../components/product/RelatedProducts'));

const ProductDetail = () => {
    const { slug } = useParams();
    const [product, setProduct] = useState(null);
    const [votes, setVotes] = useState([]);
    const [quantity, setQuantity] = useState(1);
    const [selectedImage, setSelectedImage] = useState(0);
    const [relatedProducts, setRelatedProducts] = useState([]);
    const [isLoadingRelated, setIsLoadingRelated] = useState(true);
    const dispatch = useDispatch();

	const navigate = useNavigate()


    useEffect(() => {
        // Scroll to top whenever the slug changes
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }, [slug]);

    useEffect(() => {
        const fetchProduct = async () => {
            if (slug) {
                const id = slug.split('-').pop();
                try {
                    const response = await apiProductService.showProductDetail(id);
                    setProduct(response.data.data);
                } catch (error) {
                    console.error("Error fetching product:", error);
                }
            }
        };
        const getProducts = async () => {
            const productsResponse = await apiProductService.getLists({
                page: 1,
                page_size: 10,
            });
            setRelatedProducts(productsResponse.data.data);
            setTimeout(() => setIsLoadingRelated(false), 2000);
        };

        const getListsVote = async () => {
            if (slug) {
                const id = slug.split('-').pop();
                const votesResponse = await apiVoteService.getListsVoteProducts({
                    page: 1,
                    page_size: 10,
                    product_id : id
                });
                setVotes(votesResponse.data.data);
                console.info("===========[] ===========[votesResponse] : ",votesResponse);
            }
        };

        fetchProduct().then(r => {});
        getProducts().then(r => {})
        getListsVote().then(r => {})
    }, [slug]);

    if (!product) {
        return <div className="text-center my-5">Đang tải...</div>;
    }

    const handleAddToCart = () => {
        dispatch(addToCart({ ...product, quantity, selected: true }));
    };

	const handleOrder = () => {
        try {
            // Thêm sản phẩm vào giỏ hàng
            dispatch(addToCart({ ...product, quantity, selected: true }));

            // Hiển thị thông báo thành công
            toast.success("Đã thêm sản phẩm vào giỏ hàng, đang chuyển đến trang thanh toán");

            // Đảm bảo dữ liệu được lưu vào localStorage trước khi chuyển hướng
            setTimeout(() => {
                navigate('/checkout');
            }, 500); // Tăng thời gian chờ để đảm bảo dữ liệu được lưu và người dùng thấy thông báo
        } catch (error) {
            console.error("Lỗi khi thêm sản phẩm vào giỏ hàng:", error);
            toast.error("Có lỗi xảy ra khi thêm sản phẩm vào giỏ hàng");
        }
    };

    const colors = ["primary", "secondary", "success", "danger", "info"];
    const getRandomColor = () => colors[Math.floor(Math.random() * colors.length)];

    return (
        <>
            {/* Breadcrumb */}
            <div className="breadcrumb-section">
                <Container>
                    <Breadcrumb>
                        <Breadcrumb.Item linkAs={Link} linkProps={{ to: "/" }}>
                            Trang chủ
                        </Breadcrumb.Item>
                        <Breadcrumb.Item linkAs={Link} linkProps={{ to: "/san-pham" }}>
                            Sản phẩm
                        </Breadcrumb.Item>
                        <Breadcrumb.Item>
                            {product.name}
                        </Breadcrumb.Item>
                    </Breadcrumb>
                </Container>
            </div>

            <Container className="product-detail-container">
                <div className="product-detail-card">
                    <Row>
                        <Col lg={5} md={6}>
                            <div className="product-images">
                                <img
                                    src={product.images?.[selectedImage] || product.avatar}
                                    alt={product.name}
                                    className="main-image"
                                />
                                <div className="image-thumbnails">
                                    {product.images?.map((image, idx) => (
                                        <img
                                            key={idx}
                                            src={image}
                                            alt={`${product.name} - ${idx + 1}`}
                                            className={`thumbnail ${selectedImage === idx ? 'active' : ''}`}
                                            onClick={() => setSelectedImage(idx)}
                                        />
                                    ))}
                                </div>
                            </div>
                        </Col>
                        <Col lg={7} md={6}>
                            <div className="product-info">
                                {/* Product Labels and Stock Status */}
                                <div className="d-flex align-items-center mb-3">
                                    {product?.labels.map((label) => (
                                        <Badge key={label.id} bg={getRandomColor()} className="me-2">
                                            {label.name}
                                        </Badge>
                                    ))}
                                    <span className={`stock-status ${product.number > 0 ? 'in-stock' : 'out-of-stock'}`}>
                                        {product.number > 0 ? 'Còn hàng' : 'Hết hàng'}
                                    </span>
                                </div>

                                {/* Product Title */}
                                <h1 className="product-title">
                                    {product.name}
                                </h1>

                                {/* Rating */}
                                <div className="product-rating">
                                    <div className="rating">
                                        { product.total_rating_score > 0 ? (
                                            renderStarsItem(product.total_rating_score / product.total_vote_count )
                                        ) : (
                                            renderStarsItem(0)
                                        )}
                                    </div>
                                    <span className="rating-count">({product.total_vote_count} đánh giá)</span>
                                </div>

                                {/* Price */}
                                <div className="product-price">
                                    {product.sale ? (
                                        <>
                                            <span className="current-price">{formatPrice(product.price)}</span>
                                            <span className="original-price">{formatPrice(product.price)}</span>
                                            <span className="discount-percent">-{product.sale}%</span>
                                        </>
                                    ) : (
                                        <span className="current-price">{formatPrice(product.price)}</span>
                                    )}
                                </div>



                                {/* Delivery Info */}
                                <div className="delivery-info">
                                    <h6><FaTruck className="me-2" />Thông tin vận chuyển</h6>
                                    <div>
                                        <Badge bg="success" className="me-2">Giao hàng nhanh</Badge>
                                        <span>Miễn phí vận chuyển cho đơn hàng từ 500k</span>
                                    </div>
                                </div>

                                {/* Product Actions */}
                                <div className="product-actions">
                                    <div className="quantity-selector">
                                        <span className="quantity-label">Số lượng:</span>
                                        <div className="quantity-controls">
                                            <button
                                                className="quantity-btn"
                                                onClick={() => setQuantity(Math.max(1, quantity - 1))}
                                            >
                                                <FaMinus />
                                            </button>
                                            <Form.Control
                                                type="number"
                                                value={quantity}
                                                onChange={(e) => setQuantity(Math.max(1, parseInt(e.target.value) || 1))}
                                                className="quantity-input"
                                            />
                                            <button
                                                className="quantity-btn"
                                                onClick={() => setQuantity(quantity + 1)}
                                            >
                                                <FaPlus />
                                            </button>
                                        </div>
                                    </div>

                                    <div className="action-buttons">
                                        <Button
                                            className="add-to-cart-btn"
                                            disabled={product.number === 0}
                                            onClick={handleAddToCart}
                                        >
                                            Thêm vào giỏ hàng
                                        </Button>
                                        <Button
                                            className="buy-now-btn"
                                            disabled={product.number === 0}
                                            onClick={handleOrder}
                                        >
                                            Mua ngay
                                        </Button>
                                    </div>

                                    <div className="product-policies">
                                        <div className="d-flex align-items-center mb-2">
                                            <FaTruck className="me-2 text-success" />
                                            <span>Giao hàng toàn quốc</span>
                                        </div>
                                        <div className="d-flex align-items-center mb-2">
                                            <FaShieldAlt className="me-2 text-success" />
                                            <span>Bảo hành chính hãng</span>
                                        </div>
                                        <div className="d-flex align-items-center">
                                            <FaExchangeAlt className="me-2 text-success" />
                                            <span>Đổi trả trong 7 ngày</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </Col>
                    </Row>
                </div>

                {/* Product Content */}
                <div className="product-tabs">
                    <div dangerouslySetInnerHTML={{__html: product.description}} />
                    {/* Description */}
                    {/* <div className="product-description" dangerouslySetInnerHTML={{__html: product.description}} /> */}
                </div>

                {/* Customer Reviews Section */}
                <DashboardVoteProduct product={product} votes={votes} />

                {/* Related Products Section */}
                <RelatedProducts relatedProducts={relatedProducts} isLoading={isLoadingRelated}/>

                {/* Toast Container để hiển thị thông báo */}
                <ToastContainer position="top-right" autoClose={3000} />
            </Container>
        </>
    );
};

export default ProductDetail;
