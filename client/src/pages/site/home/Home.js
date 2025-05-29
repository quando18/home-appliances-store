import React, { useEffect, useState } from "react";
import apiProductService from "../../../api/apiProductService";
import categoryService from "../../../api/categoryService";
import { Card, Col, Container, Nav, Row, Button, Carousel } from "react-bootstrap";
import ContentLoader from "react-content-loader";
import { Link } from "react-router-dom";
import { createSlug, formatPrice, renderStarsItem } from "../../../helpers/formatters";
import "../style/Home.css";
import { useDispatch } from 'react-redux';
import { addToCart } from '../../../redux/slices/cartSlice';
import { toast } from 'react-toastify';

const ProductCarousel = React.lazy(() =>
  import("../../components/product/ProductCarousel")
);
const LoadingProductSkeleton = React.lazy(() =>
  import("../../components/loading/LoadingProductSkeleton")
);

const CategoryLoader = () => {
  return (
    <Row className="gy-4">
      {[...Array(6)].map((_, index) => (
        <Col key={index} xs={6} sm={4} md={3} lg={2}>
          <div className="category-skeleton"></div>
        </Col>
      ))}
    </Row>
  );
};

const ProductLoader = () => {
  return (
    <Row className="gy-4">
      {[...Array(8)].map((_, index) => (
        <Col key={index} xs={6} sm={6} md={4} lg={3}>
          <div className="product-skeleton"></div>
        </Col>
      ))}
    </Row>
  );
};

const Home = () => {
  const [categoryProducts, setCategoryProducts] = useState({});
  const [categories, setCategories] = useState([]);
  const [loading, setLoading] = useState(true);
  const [loadingCategory, setLoadingCategory] = useState(true);
  const dispatch = useDispatch();

  useEffect(() => {
    let isMounted = true;

    const loadCategoriesAndProducts = async () => {
      setLoading(true);
      try {
        const categoriesResponse = await categoryService.getListsGuest({
          page: 1,
          page_size: 3,
        });
        if (!isMounted) return;

        const categories = categoriesResponse.data.data;
        const productsByCategory = {};

        await Promise.all(
          categories.map(async (category) => {
            const productsResponse = await apiProductService.getLists({
              page: 1,
              page_size: 10,
              category_id: category.id,
            });
            if (!isMounted) return;
            productsByCategory[category.name] = productsResponse?.data?.data;
          })
        );

        if (isMounted) setCategoryProducts(productsByCategory);
      } catch (error) {
        console.error("Error fetching categories or products:", error);
      } finally {
        if (isMounted) setLoading(false);
      }
    };

    loadCategoriesAndProducts();

    return () => {
      isMounted = false;
    };
  }, []);

    useEffect(() => {
        const fetchCategoryHome = async () => {
            setLoadingCategory(true);
            try {
                const categoriesResponse = await categoryService.getListsGuest({
                    page: 1,
                    page_size: 6,
                });
                setCategories(categoriesResponse.data.data);
            } catch (error) {
                console.error("Error fetching categories or products:", error);
            } finally {
                setTimeout(() => setLoadingCategory(false), 1000);
            }
        }
        fetchCategoryHome();
    },[]);

    // Hàm xử lý thêm vào giỏ hàng
    const handleAddToCart = (product) => {
        if (product.number <= 0) {
            toast.error("Sản phẩm đã hết hàng");
            return;
        }

        try {
            dispatch(addToCart({ ...product, quantity: 1, selected: true }));
            toast.success("Đã thêm sản phẩm vào giỏ hàng");
        } catch (error) {
            console.error("Lỗi khi thêm sản phẩm vào giỏ hàng:", error);
            toast.error("Có lỗi xảy ra khi thêm sản phẩm vào giỏ hàng");
        }
    };

  return (
    <>

        {/* Category Cards Section */}
        <section className="category-cards-section">
            <Container>
                <div className="section-header text-center mb-5">
                    <h2 className="section-title">SẢN PHẨM CỦA HEBEKERY</h2>
                </div>
                <Row className="justify-content-center">
                    {loadingCategory ? (
                        <CategoryLoader />
                    ) : (
                        <>
                            {categories.map((category, index) => {
                                // Định nghĩa màu sắc cho từng category theo thiết kế Hebekery
                                const categoryColors = [
                                    { bg: 'linear-gradient(135deg, #2d7d32 0%, #388e3c 100%)', color: '#ffffff' }, // Green
                                    { bg: 'linear-gradient(135deg, #7b1fa2 0%, #9c27b0 100%)', color: '#ffffff' }, // Purple
                                    { bg: 'linear-gradient(135deg, #f57c00 0%, #ff9800 100%)', color: '#ffffff' }, // Orange
                                    { bg: 'linear-gradient(135deg, #fbc02d 0%, #ffeb3b 100%)', color: '#333333' }, // Yellow
                                    { bg: 'linear-gradient(135deg, #0288d1 0%, #03a9f4 100%)', color: '#ffffff' }, // Blue
                                    { bg: 'linear-gradient(135deg, #d32f2f 0%, #f44336 100%)', color: '#ffffff' }  // Red
                                ];
                                const colorScheme = categoryColors[index % categoryColors.length];

                                return (
                                    <Col key={category.id} xs={12} sm={6} md={4} lg={4} xl={4} className="mb-4">
                                        <Link to={`/c/${category.slug}`} className="category-card-link">
                                            <div
                                                className="category-card"
                                                style={{
                                                    background: colorScheme.bg,
                                                    color: colorScheme.color
                                                }}
                                            >
                                                <div className="category-card-content">
                                                    <div className="category-card-text">
                                                        <h3 className="category-card-title">
                                                            {category.name.toUpperCase()}
                                                        </h3>
                                                    </div>
                                                    <div className="category-card-image">
                                                        <img
                                                            src={category.avatar || '/images/default-category.png'}
                                                            alt={category.name}
                                                            className="category-product-img"
                                                        />
                                                    </div>
                                                </div>
                                            </div>
                                        </Link>
                                    </Col>
                                );
                            })}
                        </>
                    )}
                </Row>
            </Container>
        </section>

        <Container>

            {/* Product Sections */}
            {loading ? (
                <ProductLoader />
            ) : (
                Object.keys(categoryProducts).map((categoryName, idx) => (
                    <section key={idx} className="hebekery-product-section">
                        <div className="hebekery-section-header">
                            <h2 className="hebekery-section-title">
                                {categoryName.toUpperCase()} ({categoryProducts[categoryName]?.length || 0})
                            </h2>
                            <Link to={`/c/${createSlug(categoryName)}`} className="hebekery-view-all">
                                Xem tất cả →
                            </Link>
                        </div>

                        <div className="hebekery-products-container">
                            <div className="hebekery-products-grid">
                                {categoryProducts[categoryName]?.slice(0, 4).map((product, productIdx) => (
                                    <div key={productIdx} className="hebekery-product-card">
                                        <div className="hebekery-product-image-wrapper">
                                            <Link to={`/p/${createSlug(product.name)}-${product.id}`}>
                                                <img
                                                    src={product.avatar}
                                                    alt={product.name}
                                                    className="hebekery-product-image"
                                                />
                                            </Link>
                                            {/* Badge cho sản phẩm nổi bật */}
                                            {productIdx < 2 && (
                                                <div className="hebekery-product-badge">
                                                    <span className="badge-text">{productIdx + 1}+</span>
                                                </div>
                                            )}
                                        </div>

                                        <div className="hebekery-product-info">
                                            <Link
                                                to={`/p/${createSlug(product.name)}-${product.id}`}
                                                className="hebekery-product-title"
                                            >
                                                {product.name}
                                            </Link>

                                            <div className="hebekery-product-price">
                                                <span className="current-price">{formatPrice(product.price)}</span>
                                                {product.sale > 0 && (
                                                    <span className="original-price">{formatPrice(product.sale)}</span>
                                                )}
                                            </div>

                                            <button
                                                className={`hebekery-product-status ${product.number > 0 ? 'available' : 'unavailable'}`}
                                                disabled={product.number <= 0}
                                                onClick={() => handleAddToCart(product)}
                                            >
                                                {product.number > 0 ? 'Thêm vào giỏ' : 'Hết hàng'}
                                            </button>
                                        </div>
                                    </div>
                                ))}
                            </div>

                            {/* Navigation arrows */}
                            <div className="hebekery-nav-arrows">
                                <button className="nav-arrow nav-prev">‹</button>
                                <button className="nav-arrow nav-next">›</button>
                            </div>
                        </div>
                    </section>
                ))
            )}
        </Container>
    </>
  );
};

export default Home;
