import React from 'react';
import { Container, Row, Col } from 'react-bootstrap';
import { FaPhone, FaEnvelope, FaMapMarkerAlt, FaFacebookF, FaInstagram, FaTiktok, FaYoutube } from 'react-icons/fa';
import './Footer.css';

const Footer = ({information}) => {
    return (
        <footer className="footer">
            <Container>
                <Row className="footer-main">
                    {/* Thực phẩm dinh dưỡng Hebekery */}
                    <Col lg={4} md={6} className="footer-section">
                        <h5 className="footer-title">THỰC PHẨM DINH DƯỠNG HEBEKERY</h5>
                        <div className="footer-contact-item">
                            <FaPhone className="footer-contact-icon" />
                            <span>{information?.contact_number || '097 97 64 185'}</span>
                        </div>
                        <div className="footer-contact-item">
                            <FaEnvelope className="footer-contact-icon" />
                            <span>{information?.email || 'hebekery.hebekery@gmail.com'}</span>
                        </div>
                        <div className="footer-contact-item">
                            <FaMapMarkerAlt className="footer-contact-icon" />
                            <span>{information?.full_address || '20 Hẻm Ngọc Cầu, Phường Tân Thành, Quận Tân Phú, TP HCM'}</span>
                        </div>
                        <div className="footer-business-info">
                            <p>HKD THỰC PHẨM DINH DƯỠNG MTEB - MST: 8293041855-002</p>
                        </div>
                        <div className="footer-certifications">
                            <div className="cert-placeholder">
                                <span>Bộ Công Thương</span>
                            </div>
                            <div className="cert-placeholder">
                                <span>DMCA Protected</span>
                            </div>
                        </div>
                    </Col>

                    {/* Về Hebekery */}
                    <Col lg={4} md={6} className="footer-section">
                        <h5 className="footer-title">VỀ HEBEKERY</h5>
                        <ul className="footer-links">
                            <li><a href="/about">Giới Thiệu</a></li>
                            <li><a href="/san-pham">Sản Phẩm</a></li>
                            <li><a href="/kien-thuc/dinh-duong">Kiến thức dinh dưỡng</a></li>
                            <li><a href="/chuong-trinh-thanh-vien">Chương trình thành viên</a></li>
                            <li><a href="/lien-he">Liên hệ</a></li>
                        </ul>
                    </Col>

                    {/* Hỗ trợ khách hàng */}
                    <Col lg={4} md={12} className="footer-section">
                        <h5 className="footer-title">HỖ TRỢ KHÁCH HÀNG</h5>
                        <ul className="footer-links">
                            <li><a href="/cau-hoi-thuong-gap">Câu hỏi thường gặp</a></li>
                            <li><a href="/chinh-sach-bao-mat">Chính sách bảo mật</a></li>
                            <li><a href="/chinh-sach-van-chuyen">Chính sách vận chuyển</a></li>
                            <li><a href="/chinh-sach-doi-tra">Chính sách đổi trả</a></li>
                            <li><a href="/chinh-sach-thanh-toan">Chính sách thanh toán</a></li>
                            <li><a href="/chinh-sach-diem-tong">Chính sách điểm tổng</a></li>
                        </ul>
                    </Col>
                </Row>

                {/* Social Media & Copyright */}
                <Row className="footer-bottom">
                    <Col md={12} className="text-center">
                        <div className="social-media">
                            <a href="#" className="social-link">
                                <FaFacebookF />
                            </a>
                            <a href="#" className="social-link">
                                <FaInstagram />
                            </a>
                            <a href="#" className="social-link">
                                <FaTiktok />
                            </a>
                            <a href="#" className="social-link">
                                <FaYoutube />
                            </a>
                        </div>
                        <div className="copyright">
                            <p>© Bản quyền thuộc về HEBEKERY - Hebekery của Việt Nam</p>
                        </div>
                    </Col>
                </Row>
            </Container>
        </footer>
    );
};

export default Footer;
