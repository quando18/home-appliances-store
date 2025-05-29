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
                        <div className="hero-badge">"ĂN UỐNG LÀNH MẠNH" CÙNG HEBEKERY</div>

                        <Carousel className="hero-carousel" indicators={true} controls={true} interval={5000}>
                            {slides && slides.length > 0 ? (
                                slides.map((slide, idx) => (
                                    <Carousel.Item key={idx}>
                                        <div className="slide-container">
                                            <div className="slide-decorations">
                                                <div className="circle circle-1"></div>
                                                <div className="circle circle-2"></div>
                                            </div>

                                            <div className="slide-main-content">
                                                <img
                                                    src={slide.avatar || "/images/default.png"}
                                                    alt={slide.name}
                                                    className="slide-main-image"
                                                />
                                            </div>

                                            <div className="slide-bottom">
                                                <h3 className="slide-title">{slide.name}</h3>
                                                {/* <p className="slide-description">{slide.description}</p> */}
                                                <Link to={slide.link || "#"} className="slide-btn">
                                                    Mua ngay
                                                </Link>
                                            </div>
                                        </div>
                                    </Carousel.Item>
                                ))
                            ) : (
                                // Default slides when no data from API
                                <>
                                    <Carousel.Item>
                                        <div className="slide-container">
                                            <div className="slide-decorations">
                                                <div className="circle circle-1"></div>
                                                <div className="circle circle-2"></div>
                                            </div>

                                            <div className="slide-main-content">
                                                <img
                                                    src="/images/default.png"
                                                    alt="NGŨ CỐC GRANOLA DINH DƯỠNG"
                                                    className="slide-main-image"
                                                />
                                            </div>

                                            <div className="slide-bottom">
                                                <h3 className="slide-title">NGŨ CỐC GRANOLA DINH DƯỠNG</h3>
                                                <Link to="/hat-ngu-coc-granola" className="slide-btn">
                                                    Mua ngay
                                                </Link>
                                            </div>
                                        </div>
                                    </Carousel.Item>

                                    <Carousel.Item>
                                        <div className="slide-container">
                                            <div className="slide-decorations">
                                                <div className="circle circle-1"></div>
                                                <div className="circle circle-2"></div>
                                            </div>

                                            <div className="slide-main-content">
                                                <img
                                                    src="/images/default.png"
                                                    alt="BÁNH BISCOTTI ĂN KIÊNG"
                                                    className="slide-main-image"
                                                />
                                            </div>

                                            <div className="slide-bottom">
                                                <h3 className="slide-title">BÁNH BISCOTTI ĂN KIÊNG</h3>
                                                <Link to="/banh-biscotti" className="slide-btn">
                                                    Mua ngay
                                                </Link>
                                            </div>
                                        </div>
                                    </Carousel.Item>

                                    <Carousel.Item>
                                        <div className="slide-container">
                                            <div className="slide-decorations">
                                                <div className="circle circle-1"></div>
                                                <div className="circle circle-2"></div>
                                            </div>

                                            <div className="slide-main-content">
                                                <img
                                                    src="/images/default.png"
                                                    alt="BÁNH NGÓI HẠNH NHÂN KETO"
                                                    className="slide-main-image"
                                                />
                                            </div>

                                            <div className="slide-bottom">
                                                <h3 className="slide-title">BÁNH NGÓI HẠNH NHÂN KETO</h3>
                                                <Link to="/banh-ngoi-hanh-nhan" className="slide-btn">
                                                    Mua ngay
                                                </Link>
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
