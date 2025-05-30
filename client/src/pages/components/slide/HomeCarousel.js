import React, { useState, useEffect } from 'react';
import { Carousel, Container } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import './HomeCarousel.css';
import slideService from "./../../../api/slideService";
import SlideSkeleton from './../loading/SlideSkeleton'; // Import loader
import "../../site/style/Home.css";
const HomeCarousel = () => {
    const [slides, setSlides] = useState([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        // Hàm gọi API để lấy danh sách slide
        const fetchSlides = async () => {
            try {
                const response = await slideService.getListsGuest({
                    page_site: "home"
                });
                setSlides(response.data.data);
            } catch (error) {
                console.error("Error fetching slides:", error);
            } finally {
                setLoading(false);
            }
        };

        fetchSlides();
    }, []);

    return (
        <Container fluid className="carousel-fullscreen">
            {loading ? (
                // Hiển thị Skeleton Loader khi đang tải
                <SlideSkeleton />
            ) : (
                // Hero Section - Slider
                <section className="hero-section">
                    <div className="hero-slider">
                        <div className="hero-badge">HOMELIFE STORE - ĐỒ GIA DỤNG CHẤT LƯỢNG</div>

                        <Carousel className="hero-carousel" indicators={true} controls={true} interval={5000}>
                            {slides && slides.length > 0 ? (
                                slides.map((slide, idx) => (
                                    <Carousel.Item key={idx}>
                                        <div className="slide-container elmich-style">
                                            {/* Background decorations */}
                                            <div className="slide-decorations">
                                                <div className="cloud cloud-1"></div>
                                                <div className="cloud cloud-2"></div>
                                                <div className="cloud cloud-3"></div>
                                                <div className="floating-icon icon-1">🎉</div>
                                                <div className="floating-icon icon-2">⭐</div>
                                                <div className="floating-icon icon-3">🎁</div>
                                            </div>

                                            {/* Left content */}
                                            <div className="slide-left-content">
                                                <div className="slide-badge">
                                                    <span className="badge-date">26/5 - 1/6</span>
                                                </div>

                                                <div className="slide-main-text">
                                                    <h1 className="slide-big-title">
                                                        Vui Tết <span className="highlight-text">Thiếu nhi</span>
                                                    </h1>
                                                    <h2 className="slide-sale-title">
                                                        SALE TO <span className="highlight-sale">HẾT Ý</span>
                                                    </h2>
                                                </div>

                                                <div className="slide-offers">
                                                    <div className="voucher-box">
                                                        <span className="voucher-label">Voucher tới</span>
                                                        <span className="voucher-amount">200K</span>
                                                    </div>
                                                    <div className="discount-box">
                                                        <span className="discount-label">Ưu đãi tới</span>
                                                        <span className="discount-amount">50%</span>
                                                        <span className="discount-note">Các gói nhất 99%</span>
                                                    </div>
                                                </div>

                                                <Link to={slide.link || "#"} className="slide-btn-new">
                                                    Mua ngay
                                                </Link>
                                            </div>

                                            {/* Right content - Products */}
                                            <div className="slide-right-content">
                                                <div className="slide-main-content">
                                                    <img
                                                        src={slide.avatar || "/images/default.png"}
                                                        alt={slide.name}
                                                        className="slide-main-image floating"
                                                    />
                                                </div>

                                                {/* Additional floating products */}
                                                <div className="floating-products">
                                                    <div className="floating-product product-1">
                                                        <img src="/images/product-1.png" alt="Product 1" />
                                                    </div>
                                                    <div className="floating-product product-2">
                                                        <img src="/images/product-2.png" alt="Product 2" />
                                                    </div>
                                                    <div className="floating-product product-3">
                                                        <img src="/images/product-3.png" alt="Product 3" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </Carousel.Item>
                                ))
                            ) : (
                                // Default slides when no data from API
                                <>
                                    <Carousel.Item>
                                        <div className="slide-container elmich-style">
                                            {/* Background decorations */}
                                            <div className="slide-decorations">
                                                <div className="cloud cloud-1"></div>
                                                <div className="cloud cloud-2"></div>
                                                <div className="cloud cloud-3"></div>
                                                <div className="floating-icon icon-1">🎉</div>
                                                <div className="floating-icon icon-2">⭐</div>
                                                <div className="floating-icon icon-3">🎁</div>
                                            </div>

                                            {/* Left content */}
                                            <div className="slide-left-content">
                                                <div className="slide-badge">
                                                    <span className="badge-date">Khuyến mãi</span>
                                                </div>

                                                <div className="slide-main-text">
                                                    <h1 className="slide-big-title">
                                                        Bộ Dụng Cụ <span className="highlight-text">Bếp</span>
                                                    </h1>
                                                    <h2 className="slide-sale-title">
                                                        HIỆN ĐẠI <span className="highlight-sale">TIỆN LỢI</span>
                                                    </h2>
                                                </div>

                                                <div className="slide-offers">
                                                    <div className="voucher-box">
                                                        <span className="voucher-label">Giảm tới</span>
                                                        <span className="voucher-amount">300K</span>
                                                    </div>
                                                    <div className="discount-box">
                                                        <span className="discount-label">Ưu đãi tới</span>
                                                        <span className="discount-amount">40%</span>
                                                        <span className="discount-note">Cho đơn từ 1tr</span>
                                                    </div>
                                                </div>

                                                <Link to="/dung-cu-bep" className="slide-btn-new">
                                                    Mua ngay
                                                </Link>
                                            </div>

                                            {/* Right content - Products */}
                                            <div className="slide-right-content">
                                                <div className="slide-main-content">
                                                    <img
                                                        src="/images/default.png"
                                                        alt="BỘ DỤNG CỤ BẾP HIỆN ĐẠI"
                                                        className="slide-main-image floating"
                                                    />
                                                </div>
                                            </div>
                                        </div>
                                    </Carousel.Item>

                                    <Carousel.Item>
                                        <div className="slide-container elmich-style">
                                            {/* Background decorations */}
                                            <div className="slide-decorations">
                                                <div className="cloud cloud-1"></div>
                                                <div className="cloud cloud-2"></div>
                                                <div className="cloud cloud-3"></div>
                                                <div className="floating-icon icon-1">⚡</div>
                                                <div className="floating-icon icon-2">🔌</div>
                                                <div className="floating-icon icon-3">💡</div>
                                            </div>

                                            {/* Left content */}
                                            <div className="slide-left-content">
                                                <div className="slide-badge">
                                                    <span className="badge-date">Siêu sale</span>
                                                </div>

                                                <div className="slide-main-text">
                                                    <h1 className="slide-big-title">
                                                        Đồ Điện Tử <span className="highlight-text">Gia Đình</span>
                                                    </h1>
                                                    <h2 className="slide-sale-title">
                                                        THÔNG MINH <span className="highlight-sale">TIẾT KIỆM</span>
                                                    </h2>
                                                </div>

                                                <div className="slide-offers">
                                                    <div className="voucher-box">
                                                        <span className="voucher-label">Voucher tới</span>
                                                        <span className="voucher-amount">500K</span>
                                                    </div>
                                                    <div className="discount-box">
                                                        <span className="discount-label">Ưu đãi tới</span>
                                                        <span className="discount-amount">60%</span>
                                                        <span className="discount-note">Miễn phí ship</span>
                                                    </div>
                                                </div>

                                                <Link to="/dien-tu" className="slide-btn-new">
                                                    Mua ngay
                                                </Link>
                                            </div>

                                            {/* Right content - Products */}
                                            <div className="slide-right-content">
                                                <div className="slide-main-content">
                                                    <img
                                                        src="/images/default.png"
                                                        alt="ĐỒ ĐIỆN TỬ GIA ĐÌNH"
                                                        className="slide-main-image floating"
                                                    />
                                                </div>
                                            </div>
                                        </div>
                                    </Carousel.Item>

                                    <Carousel.Item>
                                        <div className="slide-container elmich-style">
                                            {/* Background decorations */}
                                            <div className="slide-decorations">
                                                <div className="cloud cloud-1"></div>
                                                <div className="cloud cloud-2"></div>
                                                <div className="cloud cloud-3"></div>
                                                <div className="floating-icon icon-1">🏠</div>
                                                <div className="floating-icon icon-2">✨</div>
                                                <div className="floating-icon icon-3">🛋️</div>
                                            </div>

                                            {/* Left content */}
                                            <div className="slide-left-content">
                                                <div className="slide-badge">
                                                    <span className="badge-date">Hot deal</span>
                                                </div>

                                                <div className="slide-main-text">
                                                    <h1 className="slide-big-title">
                                                        Nội Thất <span className="highlight-text">Thông Minh</span>
                                                    </h1>
                                                    <h2 className="slide-sale-title">
                                                        HIỆN ĐẠI <span className="highlight-sale">SANG TRỌNG</span>
                                                    </h2>
                                                </div>

                                                <div className="slide-offers">
                                                    <div className="voucher-box">
                                                        <span className="voucher-label">Giảm tới</span>
                                                        <span className="voucher-amount">1TR</span>
                                                    </div>
                                                    <div className="discount-box">
                                                        <span className="discount-label">Ưu đãi tới</span>
                                                        <span className="discount-amount">70%</span>
                                                        <span className="discount-note">Trả góp 0%</span>
                                                    </div>
                                                </div>

                                                <Link to="/noi-that" className="slide-btn-new">
                                                    Mua ngay
                                                </Link>
                                            </div>

                                            {/* Right content - Products */}
                                            <div className="slide-right-content">
                                                <div className="slide-main-content">
                                                    <img
                                                        src="/images/default.png"
                                                        alt="NỘI THẤT THÔNG MINH"
                                                        className="slide-main-image floating"
                                                    />
                                                </div>
                                            </div>
                                        </div>
                                    </Carousel.Item>
                                </>
                            )}
                        </Carousel>
                    </div>
                </section>
            )}
        </Container>
    );
};

export default HomeCarousel;
