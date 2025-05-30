import React, { useEffect, useState } from 'react';
import { Carousel, Card, Button, Container, Row, Col, Nav } from 'react-bootstrap';
import { Link } from "react-router-dom";
import { formatPrice, createSlug, renderStarsItem } from '../../../helpers/formatters';
import ContentLoader from "react-content-loader";
import { useDispatch } from 'react-redux';
import { addToCart } from '../../../redux/slices/cartSlice';
import { toast } from 'react-toastify';

const RelatedProductsLoader = () => (
    <Row>
        {Array.from({ length: 6 }).map((_, idx) => (
            <Col key={idx} xs={12} sm={6} md={4} lg={2} className="mb-3">
                <ContentLoader
                    speed={2}
                    width="100%"
                    height={200}
                    viewBox="0 0 200 200"
                    backgroundColor="#f3f3f3"
                    foregroundColor="#ecebeb"
                >
                    <rect x="0" y="0" rx="5" ry="5" width="100%" height="120" />
                    <rect x="0" y="130" rx="5" ry="5" width="100%" height="20" />
                    <rect x="0" y="160" rx="5" ry="5" width="80%" height="20" />
                </ContentLoader>
            </Col>
        ))}
    </Row>
);

const RelatedProducts = ({ relatedProducts, isLoading }) => {
    const dispatch = useDispatch();

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
        <section className="related-products-section">
            <Container>
                <div className="section-header text-center mb-5">
                    <h2 className="section-title">SẢN PHẨM LIÊN QUAN</h2>
                    <p className="section-subtitle">Khám phá thêm những sản phẩm tương tự</p>
                </div>

                {isLoading ? (
                    <RelatedProductsLoader />
                ) : (
                    <div className="hebekery-products-grid">
                        {relatedProducts.slice(0, 8).map((product, idx) => (
                            <div key={idx} className="hebekery-product-card">
                                <div className="hebekery-product-image-wrapper">
                                    <Link to={`/p/${createSlug(product.name)}-${product.id}`}>
                                        <img
                                            src={product.avatar}
                                            alt={product.name}
                                            className="hebekery-product-image"
                                        />
                                    </Link>
                                    {/* Badge cho sản phẩm nổi bật */}
                                    {idx < 2 && (
                                        <div className="hebekery-product-badge">
                                            <span className="badge-text">{idx + 1}+</span>
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

                                    <div className="hebekery-product-rating">
                                        {product.total_rating_score > 0 ? (
                                            renderStarsItem(product.total_rating_score / product.total_vote_count)
                                        ) : (
                                            renderStarsItem(0)
                                        )}
                                    </div>

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
                )}
            </Container>
        </section>
    );
};

export default RelatedProducts;
