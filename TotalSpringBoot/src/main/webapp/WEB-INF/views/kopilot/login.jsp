<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, java.lang.*, java.sql.*, java.io.*, org.owasp.esapi.ESAPI, com.sun.org.apache.xerces.internal.impl.dv.util.*"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page import="com.infotech.config.Utils"%>
<%
	
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">

<link rel="stylesheet" href="/assets/css/opensans.css">
<link rel="stylesheet" href="/assets/css/slick.min.css" type="text/css"
	charset="UTF-8">
<script defer="" src="/assets/scripts/vendors/jquery.min.js"></script>
<script src="./pages/Report/index.js" charset="utf-8"></script>
<script src="./pages/Report/index.js" charset="UTF-8"></script>
<script defer="" src="/assets/scripts/vendors.js"></script>
<script defer="" src="/assets/scripts/app.js"></script>
<link rel="icon" type="image/png" href="/assets/images/favicon.png">
<title></title>



<body>
	<div id="app">
		<div class="landing-page">
			<main class="landing-main">
				<header class="o-header">
					<div class="container">
						<div class="o-header__menu1">
							<a class="o-section" href="#"><img
								class="o-header__logo__img"
								src="../../assets/images/content/logo.png"></a><input
								type="checkbox" id="checkbox1" class="checkbox1 visuallyHidden"><label
								for="checkbox1"><div class="hamburger hamburger1">
									<span class="bar bar1"></span><span class="bar bar2"></span><span
										class="bar bar3"></span><span class="bar bar4"></span>
								</div></label>
						</div>
						<nav class="o-header__menu">
							<a href="#what-is-it" class="o-header__menu__item js-scroll-to">Kopilot
								Filom nedir?</a><a href="#best-for-you"
								class="o-header__menu__item js-scroll-to">Ürünlerimiz</a><a
								href="#support" class="o-header__menu__item js-scroll-to">Yardım</a><a
								href="https://hizligiris.com.tr/hizligiris/oauth/authorize?client_id=KopilotFilom&amp;scope=phone%20openid&amp;redirect_uri=https://kopilotfilom.turkcell.com.tr/login&amp;response_type=code&amp;state=State.5sbYD-k_sAy-dLzPczNWFwWV4rQcDBILFbFxtSSLL4Lz4k7NQOhrJC1EkVIXgL9sFfqoa5BCOeQvN8gAOynWxLI&amp;nonce=Nonce.7EknZwkIiPLg7AjphycA-p95LEWqqkoVE2ue9MasNEwX74vcrmmVRB7R49uPjyhprP3B_1664wfCWJ3r_-fAFZz&amp;prompt=login&amp;acr_values=3&amp;display=page&amp;ui_locales=tr&amp;claims_locales=tr"
								class="o-header__menu__item o-header__menu__item--highlighted js-login-popup"
								target="_blank"><img
								src="../../assets/images/content/hizli-giris-buton.png"></a>
						</nav>
					</div>
				</header>
				<div class="m-hero"
					style="background-image: url(&quot;../../assets/images/content/04_1180x500.jpg&quot;); height: 881px;">
					<div class="container">
						<h2>
							Verimli filo yönetimi, güvenli sürüş deneyimi ve tasarruf için,
							araçlarınızla ilgili tüm bilgiler<br>
							<span class="m-hero__highlighted">Kopilot Filom’da</span>
						</h2>
						<div class="m-hero__note">Şirketinizin yeni çalışanı Kopilot
							Filom ile kolaylığın keyfini sürün!</div>
						<div class="m-hero__action">
							<a class="a-btn"
								href="https://www.turkcell.com.tr/tr/kurumsal/form/kurumsal-urun-basvuru-formu?tpid=2&amp;urun=kopilot-filom"
								target="_blank">Başvur</a><a
								class="a-btn a-btn--with-icon icon-play a-btn--secondary a-btn--secondary--white"
								data-btn-type="video-button"
								data-base-class="fancybox-video-mobile"
								data-url="https://www.youtube.com/embed/BcCgrJFV7Gs"
								data-title="Lorem ipsum dolor sit amet" data-desc="true"
								data-button="Detayları Gör" data-btnhref="javascript:;"
								href="javascript:;">Kopilot Filom’u Keşfet</a>
						</div>
						<div class="m-hero__scroll">
							<span>Keşfe çıkmak için sayfayı kaydırın</span>
						</div>
					</div>
				</div>
				<div class="m-section m-what-is-it" id="what-is-it">
					<div class="container">
						<h2 class="m-section__title">Kopilot Filom Nedir?</h2>
						<p>Kopilot Filom, şirketlerin araçları ve sürücüleriyle ilgili
							anlık bilgilere, sürüş skoruna ve daha birçok özelliğe kolayca
							ulaşarak, verimliliğini ve güvenliğini arttırmasını sağlayan
							Turkcell ürünüdür.</p>
					</div>
				</div>
				<div class="m-banner-card">
					<div class="m-banner-card__banner"
						style="background-image: url(&quot;../../assets/images/content/02_1440x500.jpg&quot;);">
						<div class="container">
							<h3>Daha Akıllı, Daha Güvenli, Daha Tasarruflu...</h3>
						</div>
					</div>
					<div class="m-banner-card__cards">
						<div class="container">
							<div class="m-banner-card__cards__inner">
								<div class="m-flex">
									<div>
										<div class="m-card-plain">
											<div class="m-card-plain__head"
												style="background-color: rgb(34, 51, 67);">
												<h3 class="m-card-plain__title">Aracınızla ilgili tüm
													bilgiler Kopilot Filom’da!</h3>
											</div>
											<div class="m-card-plain__body">
												<p>Araçlarınızın tüm bilgilerine tek platform üzerinden
													ulaşıp, anlık görüntüleyerek zaman tasarrufu sağlayın.</p>
											</div>
										</div>
									</div>
									<div>
										<div class="m-card-plain">
											<div class="m-card-plain__head"
												style="background-color: rgb(34, 51, 67);">
												<h3 class="m-card-plain__title">Filonuzu verimli ve
													güvenli yönetin!</h3>
											</div>
											<div class="m-card-plain__body">
												<p>Araçlarınızla ilgili aldığınız bildirim, alarm ve
													raporlar ile filonuzu daha verimli ve güvenli yönetin.</p>
											</div>
										</div>
									</div>
									<div>
										<div class="m-card-plain">
											<div class="m-card-plain__head"
												style="background-color: rgb(34, 51, 67);">
												<h3 class="m-card-plain__title">Sürücülerinizi güvenli
													sürüş için teşvik edin!</h3>
											</div>
											<div class="m-card-plain__body">
												<p>Ani hızlanma, sert fren, sert dönüş, hız aşımına göre
													oluşan sürüş skorunu takip ederek sürücülerinizi güvenli
													sürüşe teşvik edin.</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="m-special-for-you">
					<div class="container">
						<h3 class="m-special-for-you__title">Size Özel</h3>
						<p class="m-special-for-you__intro">Size Özel kampanyalar ile
							filo masraflarınızda tasarruf sağlayın.</p>
						<div class="m-carousel m-special-for-you__carousel"
							data-pagination="true" data-space-between="16"
							data-slides-per-view="1" data-direction="vertical"
							data-loop="true" data-counter="true" data-autoplay="true">
							<div
								class="swiper-container swiper-container-initialized swiper-container-vertical">
								<div class="swiper-wrapper"
									style="transform: translate3d(0px, -712px, 0px); transition-duration: 0ms;">
									<div
										class="swiper-slide swiper-slide-duplicate swiper-slide-next swiper-slide-duplicate-prev"
										data-swiper-slide-index="0"
										style="height: 340px; margin-bottom: 16px;">
										<div class="m-special-for-you__carousel__item">
											<figure class="m-special-for-you__carousel__img">
												<img src="../../assets/images/content/03_480x340.jpg">
											</figure>
											<div class="m-special-for-you__carousel__text">
												<h4>Kopilot Filom ve hesApplı iş birliği ile
													araçlarınıza Petrol Ofisi istasyonlarından indirimli
													akaryakıt alarak filo masraflarınızda tasarruf sağlayın!</h4>
												<p>İşletmelerin araçlarına takılan hesApplı Yakıt
													Ekipmanı (HYE) sayesinde Petrol Ofisi istasyonlarından
													araçlarından inmeden indirimli akaryakıt almalarını
													sağlayan hesApplı Yakıt Sistemi ile kayıt ettiğiniz araç
													sayısına göre indirim oranından faydalanın.</p>
											</div>
										</div>
									</div>
									<div
										class="swiper-slide swiper-slide-duplicate-active swiper-slide-prev swiper-slide-duplicate-next"
										data-swiper-slide-index="0"
										style="height: 340px; margin-bottom: 16px;">
										<div class="m-special-for-you__carousel__item">
											<figure class="m-special-for-you__carousel__img">
												<img src="../../assets/images/content/03_480x340.jpg">
											</figure>
											<div class="m-special-for-you__carousel__text">
												<h4>Kopilot Filom ve hesApplı iş birliği ile
													araçlarınıza Petrol Ofisi istasyonlarından indirimli
													akaryakıt alarak filo masraflarınızda tasarruf sağlayın!</h4>
												<p>İşletmelerin araçlarına takılan hesApplı Yakıt
													Ekipmanı (HYE) sayesinde Petrol Ofisi istasyonlarından
													araçlarından inmeden indirimli akaryakıt almalarını
													sağlayan hesApplı Yakıt Sistemi ile kayıt ettiğiniz araç
													sayısına göre indirim oranından faydalanın.</p>
											</div>
										</div>
									</div>
									<div
										class="swiper-slide swiper-slide-duplicate swiper-slide-active swiper-slide-duplicate-prev"
										data-swiper-slide-index="0"
										style="height: 340px; margin-bottom: 16px;">
										<div class="m-special-for-you__carousel__item">
											<figure class="m-special-for-you__carousel__img">
												<img src="../../assets/images/content/03_480x340.jpg">
											</figure>
											<div class="m-special-for-you__carousel__text">
												<h4>Kopilot Filom ve hesApplı iş birliği ile
													araçlarınıza Petrol Ofisi istasyonlarından indirimli
													akaryakıt alarak filo masraflarınızda tasarruf sağlayın!</h4>
												<p>İşletmelerin araçlarına takılan hesApplı Yakıt
													Ekipmanı (HYE) sayesinde Petrol Ofisi istasyonlarından
													araçlarından inmeden indirimli akaryakıt almalarını
													sağlayan hesApplı Yakıt Sistemi ile kayıt ettiğiniz araç
													sayısına göre indirim oranından faydalanın.</p>
											</div>
										</div>
									</div>
								</div>
								<div
									class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets">
									<span
										class="swiper-pagination-bullet swiper-pagination-bullet-active"
										tabindex="0" role="button" aria-label="Go to slide 1"></span>
								</div>
								<div class="swiper-counter">
									<span>1/1</span>
								</div>
								<span class="swiper-notification" aria-live="assertive"
									aria-atomic="true"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="m-how-it-works">
					<div class="container">
						<div class="m-how-it-works__box">
							<h3>Kopilot Filom Nasıl Çalışır?</h3>
							<div class="m-how-it-works__items">
								<div class="m-how-it-works__item">
									<figure>
										<img src="../../assets/images/icons/phone.svg">
									</figure>
									<span class="m-how-it-works__item__no">01</span>
									<p>Kurumsal Müşteri Temsilciniz ile görüşerek Kopilot
										Filom’u satın alın</p>
								</div>
								<div class="m-how-it-works__item">
									<figure>
										<img src="../../assets/images/icons/car2.svg">
									</figure>
									<span class="m-how-it-works__item__no">02</span>
									<p>Kopilot Filom cihazlarını aracınıza takın</p>
								</div>
								<div class="m-how-it-works__item">
									<figure>
										<img src="../../assets/images/icons/key.svg">
									</figure>
									<span class="m-how-it-works__item__no">03</span>
									<p>kopilotfilom.turkcell.com.tr adresinden tanımlı GSM
										numaranız ile giriş yapın</p>
								</div>
								<div class="m-how-it-works__item">
									<figure>
										<img src="../../assets/images/icons/new-folder.svg">
									</figure>
									<span class="m-how-it-works__item__no">04</span>
									<p>Yönetim alanından Kopilot Filom servisini kullanacak
										araçlarınızı ve diğer bilgileri ekleyin</p>
								</div>
								<div class="m-how-it-works__item">
									<figure>
										<img src="../../assets/images/icons/map.svg">
									</figure>
									<span class="m-how-it-works__item__no">05</span>
									<p>Filonuzdaki araçları haritadan takip edin. Araçlarınızla
										ilgili anlık verilere, detaylı raporlara ve sürücülerinizin
										sürüş skorlarına Kopilot Filom platformundan kolayca ulaşın.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="m-properties">
					<div class="container">
						<div class="m-properties__banner"
							style="background-color: rgb(34, 51, 67);"></div>
					</div>
					<div class="m-properties__carousel-wrapper">
						<div class="container">
							<div class="m-carousel m-properties__carousel"
								data-pagination="true" data-space-between="16"
								data-slides-per-view="1" data-direction="horizontal"
								data-loop="true" data-counter="true" data-autoplay="true"
								data-effect="fade"
								data-fade-effect="{&quot;crossFade&quot;:true}">
								<div
									class="swiper-container swiper-container-fade swiper-container-initialized swiper-container-horizontal">
									<div class="swiper-wrapper" style="transition-duration: 0ms;">
										<div class="swiper-slide swiper-slide-duplicate"
											data-swiper-slide-index="4"
											style="width: 890px; opacity: 0; transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
											<div class="m-properties__carousel__item">
												<figure class="m-properties__carousel__img">
													<img src="../../assets/images/content/03_673x418.jpg">
												</figure>
												<div class="m-properties__carousel__text">
													<h4>Kopilot Filom Özellikleri</h4>
													<h5>Raporlama</h5>
													<p>Araçlarınızın kullanım detayları ve tüm bilgilerini
														içeren geniş raporlama seçeneklerine ulaşın. Rapor takvimi
														ile sık kullandığınız raporlara kolaylıkla erişin.</p>
												</div>
											</div>
										</div>
										<div class="swiper-slide" data-swiper-slide-index="0"
											style="width: 890px; opacity: 0; transform: translate3d(-890px, 0px, 0px); transition-duration: 0ms;">
											<div class="m-properties__carousel__item">
												<figure class="m-properties__carousel__img">
													<img src="../../assets/images/content/02_673x418.jpg">
												</figure>
												<div class="m-properties__carousel__text">
													<h4>Kopilot Filom Özellikleri</h4>
													<h5>Dashboard</h5>
													<p>Filonuz ile ilgili özet durum bilgilerine erişin.
														Araçlarınızın anlık durumu, ihlal sayısı, sürücülerinizin
														kullanım skoru ve dahası tek sayfada…</p>
												</div>
											</div>
										</div>
										<div class="swiper-slide swiper-slide-prev"
											data-swiper-slide-index="1"
											style="width: 890px; opacity: 0; transform: translate3d(-1780px, 0px, 0px); transition-duration: 0ms;">
											<div class="m-properties__carousel__item">
												<figure class="m-properties__carousel__img">
													<img src="../../assets/images/content/04_673x418.jpg">
												</figure>
												<div class="m-properties__carousel__text">
													<h4>Kopilot Filom Özellikleri</h4>
													<h5>Takip</h5>
													<p>Araçlarınızı harita üzerinde ya da liste olarak
														izleyin. Araçlarınızla ilgili hız, ihlal, park, sürüş
														skoru gibi daha fazla bilgiye araç kartından kolaylıkla
														erişin.</p>
												</div>
											</div>
										</div>
										<div class="swiper-slide swiper-slide-active"
											data-swiper-slide-index="2"
											style="width: 890px; opacity: 1; transform: translate3d(-2670px, 0px, 0px); transition-duration: 0ms;">
											<div class="m-properties__carousel__item">
												<figure class="m-properties__carousel__img">
													<img src="../../assets/images/content/05_673x418.jpg">
												</figure>
												<div class="m-properties__carousel__text">
													<h4>Kopilot Filom Özellikleri</h4>
													<h5>Yönetim</h5>
													<p>Filonuzu daha etkin yönetmek için araçlarınız için
														gruplar ve alt kullanıcılar tanımlayın. Araçlarınıza
														sürücülerinizi ekleyerek filonuzu sistematik yönetin.Mesai
														dışı kullanımları raporlamak için çalışma saati tanımını
														yapın.</p>
												</div>
											</div>
										</div>
										<div class="swiper-slide swiper-slide-next"
											data-swiper-slide-index="3"
											style="width: 890px; opacity: 0; transform: translate3d(-3560px, 0px, 0px); transition-duration: 0ms;">
											<div class="m-properties__carousel__item">
												<figure class="m-properties__carousel__img">
													<img src="../../assets/images/content/01_673x418.jpg">
												</figure>
												<div class="m-properties__carousel__text">
													<h4>Kopilot Filom Özellikleri</h4>
													<h5>Bildirimler- Alarmlar</h5>
													<p>Kopilot Filom araçtaki belirli sorunlarla ilgili
														haberdar eder. Motor arızaları, akü sorunu gibi önemli
														konularda bilginiz olsun. Bunlara ek filonuzla ilgili
														bilgi almak istediğiniz konularda alarmlar(bölgeye
														giriş/çıkış, adrese uğrama, hız aşımı vb) tanımlayın,
														takibini yapın.</p>
												</div>
											</div>
										</div>
										<div class="swiper-slide" data-swiper-slide-index="4"
											style="width: 890px; opacity: 0; transform: translate3d(-4450px, 0px, 0px); transition-duration: 0ms;">
											<div class="m-properties__carousel__item">
												<figure class="m-properties__carousel__img">
													<img src="../../assets/images/content/03_673x418.jpg">
												</figure>
												<div class="m-properties__carousel__text">
													<h4>Kopilot Filom Özellikleri</h4>
													<h5>Raporlama</h5>
													<p>Araçlarınızın kullanım detayları ve tüm bilgilerini
														içeren geniş raporlama seçeneklerine ulaşın. Rapor takvimi
														ile sık kullandığınız raporlara kolaylıkla erişin.</p>
												</div>
											</div>
										</div>
										<div class="swiper-slide swiper-slide-duplicate"
											data-swiper-slide-index="0"
											style="width: 890px; opacity: 0; transform: translate3d(-5340px, 0px, 0px); transition-duration: 0ms;">
											<div class="m-properties__carousel__item">
												<figure class="m-properties__carousel__img">
													<img src="../../assets/images/content/02_673x418.jpg">
												</figure>
												<div class="m-properties__carousel__text">
													<h4>Kopilot Filom Özellikleri</h4>
													<h5>Dashboard</h5>
													<p>Filonuz ile ilgili özet durum bilgilerine erişin.
														Araçlarınızın anlık durumu, ihlal sayısı, sürücülerinizin
														kullanım skoru ve dahası tek sayfada…</p>
												</div>
											</div>
										</div>
									</div>
									<div
										class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets">
										<span class="swiper-pagination-bullet" tabindex="0"
											role="button" aria-label="Go to slide 1"></span><span
											class="swiper-pagination-bullet" tabindex="0" role="button"
											aria-label="Go to slide 2"></span><span
											class="swiper-pagination-bullet swiper-pagination-bullet-active"
											tabindex="0" role="button" aria-label="Go to slide 3"></span><span
											class="swiper-pagination-bullet" tabindex="0" role="button"
											aria-label="Go to slide 4"></span><span
											class="swiper-pagination-bullet" tabindex="0" role="button"
											aria-label="Go to slide 5"></span>
									</div>
									<div class="swiper-counter">
										<span>3/5</span>
									</div>
									<span class="swiper-notification" aria-live="assertive"
										aria-atomic="true"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="m-best-for-you" id="best-for-you">
					<div class="container">
						<h3>Sizin İçin En İyi Ürünü Bulun</h3>
						<div class="m-flex">
							<div class="m-best-for-you__box">
								<figure>
									<img src="../../assets/images/content/06_580x326_Sol.jpg">
								</figure>
								<h4>Kopilot Filom OBD</h4>
								<p>Araçlarınızın OBD II soketine yerleştireceğiniz Kopilot
									Filom cihazı sayesinde Kopilot Filom Platformundan araçlarınızı
									harita üzerinden izleyebilir, aracınızın sağlığı ile ilgili
									motor arıza, akü durumu bilgilerine ulaşabilir, periyodik
									bakımları takip edebilirsiniz.</p>
								<p>Hız limiti ve bölge tanımlayabilir ve bu konularla ilgili
									anlık alarmlar alabilirsiniz. Ani hızlanma, yavaşlama, hız
									aşımı ve sert fren bilgilerine göre oluşan "Sürüş Skorunu"
									görüntüleyerek sürücülerinizi daha güvenli sürüş için teşvik
									edebilirsiniz. Araçlarınız ve sürücüleriniz hakkında güncel ve
									geçmişe dönük raporlar alabilirsiniz.</p>
								<p>Tak-çalıştır cihazınız ile montaj işlemi için vakit
									harcamadan kullanıma başlayabilirsiniz.</p>
								<a class="a-btn a-btn--secondary" data-modal="true"
									data-fancybox="content" data-src="#modal-compatible"
									data-base-class="fancybox-compatible" href="javascript:;">Aracım
									Uyumlu Mu?</a>
							</div>
							<div class="m-best-for-you__box">
								<figure>
									<img src="../../assets/images/content/06_580x326_01.jpg">
								</figure>
								<h4>Kopilot Filom BB</h4>
								<p>Araçlarınıza montajı yapılacak Kopilot Filom cihazı ile
									Kopilot Filom Platformundan araçlarınızı harita üzerinden
									izleyebilir, hız limiti ve bölge tanımlayabilir ve bu konularla
									ilgili anlık alarmlar alabilirsiniz. Araçlarınız ve
									sürücüleriniz hakkında güncel ve geçmişe dönük raporlar
									alabilirsiniz. Ek aksesuarlar ile farklı alanlarda detaylı
									bilgilere erişebilirsiniz.</p>
								<p>Cihazlarınızın, size en yakın servis noktalarında
									araçlarınıza montajını yaptırabilirsiniz.</p>
								<a class="a-btn a-btn--secondary" data-modal="true"
									data-fancybox="content" data-src="#modal-service-points"
									data-base-class="fancybox-compatible" href="javascript:;">Servis
									Noktaları</a>
							</div>
						</div>
					</div>
				</div>
				<div id="modal-compare" class="m-modal m-modal--compare">
					<div class="m-modal__body">
						<h3>Sizin için en iyi ürünü bulmak için karşılaştırın</h3>
						<p>Lorem ipsum dolor sit amet consectetur adipiscing lorem
							ipsum dolor sit amet.</p>
						<div class="m-modal__compare-table">
							<table>
								<thead>
									<tr>
										<th width="180">Özellikler</th>
										<td>Kopilot Filom OBD</td>
										<td>Kopilot Filom BB</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>Safety Score</th>
										<td><i class="icon icon-check"></i></td>
										<td><i class="icon icon-minus"></i></td>
									</tr>
									<tr>
										<th>Navigation</th>
										<td><i class="icon icon-check"></i></td>
										<td><i class="icon icon-minus"></i></td>
									</tr>
									<tr>
										<th>Discounts</th>
										<td><i class="icon icon-check"></i></td>
										<td><i class="icon icon-minus"></i></td>
									</tr>
									<tr>
										<th>Speed &amp; Boundary Alerts</th>
										<td><i class="icon icon-check"></i></td>
										<td><i class="icon icon-minus"></i></td>
									</tr>
									<tr>
										<th>4G LTE</th>
										<td><i class="icon icon-check"></i></td>
										<td><i class="icon icon-minus"></i></td>
									</tr>
									<tr>
										<th>WiFi Hotspot</th>
										<td><i class="icon icon-check"></i></td>
										<td><i class="icon icon-minus"></i></td>
									</tr>
									<tr>
										<th>Bluetooth Speaker</th>
										<td><i class="icon icon-check"></i></td>
										<td><i class="icon icon-minus"></i></td>
									</tr>
									<tr>
										<th>Numbershare</th>
										<td><i class="icon icon-check"></i></td>
										<td><i class="icon icon-minus"></i></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<a class="a-btn-icon btn-close" data-fancybox-close="true"
						href="javascript:;"><i class="icon-close"></i>ButtonIcon</a>
				</div>
				<div id="modal-compatible" class="m-modal m-modal--compatible"
					data-component="[object Object]">
					<div class="m-modal__body">
						<h3>Aracım Uyumlu Mu?</h3>
						<p>Kopilot Filom OBD, güncel OBD2 standartlarına uygun olarak
							geliştirilmiştir. Cihazın aracınıza uyumluluğunu kontrol ediniz.
							Araç uyumluluğuna ilişkin detaylı bilgiler için Yardım alanını
							inceleyebilirsiniz.</p>
						<form data-url="../../assets/data/VehicleList.json">
							<div class="m-form-group js-hidden-fields">
								<div class="m-form-group__child"></div>
							</div>
							<div class="m-form-group">
								<div class="m-form-group__child">
									<select class="m-select js-brand select2-hidden-accessible"
										data-placeholder="Marka"
										data-parsley-errors-container="#select01-error"
										data-parsley-error-message="Bu alan boş bırakılamaz."
										required="" name="s0-0-0-10-81-89-90-select"
										id="ss0-0-0-10-81-89-90-select"
										data-select2-id="ss0-0-0-10-81-89-90-select" tabindex="-1"
										aria-hidden="true"><option value=""
											data-select2-id="7">Marka</option>
										<option value="alfa-romeo">Alfa Romeo</option>
										<option value="aston-martin">Aston Martin</option>
										<option value="audi">Audi</option>
										<option value="bmw">BMW</option>
										<option value="fiat">Fiat</option>
										<option value="bentley">Bentley</option>
										<option value="bugatti">Bugatti</option>
										<option value="cadillac">Cadillac</option>
										<option value="chery">Chery</option>
										<option value="chevrolet">Chevrolet</option>
										<option value="chrysler">Chrysler</option>
										<option value="citroen">Citroen</option>
										<option value="dacia">Dacia</option>
										<option value="daihatsu">Daihatsu</option>
										<option value="dodge">Dodge</option>
										<option value="ferrari">Ferrari</option>
										<option value="ford">Ford</option>
										<option value="geely">Geely</option>
										<option value="honda">Honda</option>
										<option value="hummer">Hummer</option>
										<option value="hyundai">Hyundai</option>
										<option value="Ikco">Ikco</option>
										<option value="Infiniti">Infiniti</option>
										<option value="Jaguar">Jaguar</option>
										<option value="Jeep">Jeep</option>
										<option value="Kia">Kia</option>
										<option value="Koenigsegg">Koenigsegg</option>
										<option value="Ktm">Ktm</option>
										<option value="Lada">Lada</option>
										<option value="Lamborghini">Lamborghini</option>
										<option value="Lancia">Lancia</option>
										<option value="Land Rover">Land Rover</option>
										<option value="Lexus">Lexus</option>
										<option value="Lincoln">Lincoln</option>
										<option value="Maserati">Maserati</option>
										<option value="Maybach">Maybach</option>
										<option value="Mazda">Mazda</option>
										<option value="Mercedes">Mercedes</option>
										<option value="Mercury">Mercury</option>
										<option value="Mini">Mini</option>
										<option value="Mitsubishi">Mitsubishi</option>
										<option value="Nissan">Nissan</option>
										<option value="Opel">Opel</option>
										<option value="Peugeot">Peugeot</option>
										<option value="Porsche">Porsche</option>
										<option value="Proton">Proton</option>
										<option value="Range Rover">Range Rover</option>
										<option value="Renault">Renault</option>
										<option value="Saab">Saab</option>
										<option value="Seat">Seat</option>
										<option value="Skoda">Skoda</option>
										<option value="Smart">Smart</option>
										<option value="Ssangyong">Ssangyong</option>
										<option value="Subaru">Subaru</option>
										<option value="Suzuki">Suzuki</option>
										<option value="Tata">Tata</option>
										<option value="Tesla">Tesla</option>
										<option value="Toyota">Toyota</option>
										<option value="Volkswagen">Volkswagen</option>
										<option value="Volvo">Volvo</option>
										<option value="Isuzu">Isuzu</option></select><span
										class="select2 select2-container select2-container--default"
										dir="ltr" data-select2-id="1" style="width: auto;"><span
										class="selection"><span
											class="select2-selection select2-selection--single"
											role="combobox" aria-haspopup="true" aria-expanded="false"
											tabindex="0" aria-disabled="false"
											aria-labelledby="select2-ss0-0-0-10-81-89-90-select-container"><span
												class="select2-selection__rendered"
												id="select2-ss0-0-0-10-81-89-90-select-container"
												role="textbox" aria-readonly="true"><span
													class="select2-selection__placeholder">Marka</span></span><span
												class="select2-selection__arrow" role="presentation"><b
													role="presentation"></b></span></span></span><span class="dropdown-wrapper"
										aria-hidden="true"></span></span>
									<div class="m-select-error" id="select01-error"></div>
								</div>
							</div>
							<div class="m-form-group">
								<div class="m-form-group__child">
									<select class="m-select js-model select2-hidden-accessible"
										data-placeholder="Model"
										data-parsley-errors-container="#select01-error"
										data-parsley-error-message="Bu alan boş bırakılamaz."
										required="" name="s0-0-0-10-81-91-92-select"
										id="s0-0-0-10-81-91-92-select"
										data-select2-id="s0-0-0-10-81-91-92-select" disabled=""
										tabindex="-1" aria-hidden="true"></select><span
										class="select2 select2-container select2-container--default select2-container--disabled"
										dir="ltr" data-select2-id="2" style="width: auto;"><span
										class="selection"><span
											class="select2-selection select2-selection--single"
											role="combobox" aria-haspopup="true" aria-expanded="false"
											tabindex="-1" aria-disabled="true"
											aria-labelledby="select2-s0-0-0-10-81-91-92-select-container"><span
												class="select2-selection__rendered"
												id="select2-s0-0-0-10-81-91-92-select-container"
												role="textbox" aria-readonly="true"><span
													class="select2-selection__placeholder">Model</span></span><span
												class="select2-selection__arrow" role="presentation"><b
													role="presentation"></b></span></span></span><span class="dropdown-wrapper"
										aria-hidden="true"></span></span>
									<div class="m-select-error" id="select01-error"></div>
								</div>
							</div>
							<div class="m-form-group">
								<div class="m-form-group__child">
									<a class="a-btn a-btn--full js-submit" href="javascript:;">Tamam</a>
								</div>
							</div>
						</form>
					</div>
					<a class="a-btn-icon btn-close" data-fancybox-close="true"
						href="javascript:;"><i class="icon-close"></i>ButtonIcon</a>
				</div>
				<div id="modal-service-points" class="m-modal m-modal--compatible">
					<div class="m-modal__body">
						<h3>Servis Noktaları</h3>
						<p>Kopilot Filom BB cihazınız için Servis Hizmet Noktalarını
							görüntüleyebilirsiniz.</p>
						<form data-url="../../assets/data/ServicePoints.json">
							<div class="m-form-group">
								<div class="m-form-group__child">
									<select class="m-select js-city select2-hidden-accessible"
										data-placeholder="İl"
										data-parsley-errors-container="#select-city-error"
										data-parsley-error-message="Bu alan boş bırakılamaz."
										required="" name="s0-0-0-10-95-100-101-select"
										id="s0-0-0-10-95-100-101-select"
										data-select2-id="s0-0-0-10-95-100-101-select" tabindex="-1"
										aria-hidden="true"><option value=""
											data-select2-id="8">İl</option>
										<option value="ADANA">ADANA</option>
										<option value="ADIYAMAN">ADIYAMAN</option>
										<option value="AFYON">AFYON</option>
										<option value="AGRI">AGRI</option>
										<option value="AKSARAY ">AKSARAY</option>
										<option value="AMASYA">AMASYA</option>
										<option value="ANKARA">ANKARA</option>
										<option value="ANTALYA">ANTALYA</option>
										<option value="ARDAHAN">ARDAHAN</option>
										<option value="ARTVİN">ARTVİN</option>
										<option value="AYDIN">AYDIN</option>
										<option value="BALIKESİR">BALIKESİR</option>
										<option value="BARTIN">BARTIN</option>
										<option value="BATMAN">BATMAN</option>
										<option value="BAYBURT">BAYBURT</option>
										<option value="BİLECİK">BİLECİK</option>
										<option value="BİNGÖL">BİNGÖL</option>
										<option value="BİTLİS">BİTLİS</option>
										<option value="BOLU">BOLU</option>
										<option value="BURDUR">BURDUR</option>
										<option value="BURSA">BURSA</option>
										<option value="ÇANAKKALE">ÇANAKKALE</option>
										<option value="ÇANKIRI">ÇANKIRI</option>
										<option value="ÇORUM">ÇORUM</option>
										<option value="DENİZLİ">DENİZLİ</option>
										<option value="DİYARBAKIR">DİYARBAKIR</option>
										<option value="DÜZCE">DÜZCE</option>
										<option value="EDİRNE">EDİRNE</option>
										<option value="ELAZIĞ">ELAZIĞ</option>
										<option value="ERZİNCAN">ERZİNCAN</option>
										<option value="ERZURUM">ERZURUM</option>
										<option value="ESKİŞEHİR">ESKİŞEHİR</option>
										<option value="GAZİANTEP">GAZİANTEP</option>
										<option value="GİRESUN">GİRESUN</option>
										<option value="HAKKARİ">HAKKARİ</option>
										<option value="HATAY">HATAY</option>
										<option value="ISPARTA">ISPARTA</option>
										<option value="İSTANBUL">İSTANBUL</option>
										<option value="İZMİR">İZMİR</option>
										<option value="KAHRAMANMARAŞ">KAHRAMANMARAŞ</option>
										<option value="KARABÜK">KARABÜK</option>
										<option value="KARAMAN">KARAMAN</option>
										<option value="KARS">KARS</option>
										<option value="KASTAMONU">KASTAMONU</option>
										<option value="KAYSERİ">KAYSERİ</option>
										<option value="KIRIKKALE">KIRIKKALE</option>
										<option value="KIRKLARELİ">KIRKLARELİ</option>
										<option value="KIRŞEHİR">KIRŞEHİR</option>
										<option value="KİLİS">KİLİS</option>
										<option value="KOCAELİ">KOCAELİ</option>
										<option value="KONYA">KONYA</option>
										<option value="KÜTAHYA">KÜTAHYA</option>
										<option value="MALATYA">MALATYA</option>
										<option value="MANİSA">MANİSA</option>
										<option value="MARDİN">MARDİN</option>
										<option value="MERSİN">MERSİN</option>
										<option value="MUĞLA">MUĞLA</option>
										<option value="MUŞ">MUŞ</option>
										<option value="NEVŞEHİR">NEVŞEHİR</option>
										<option value="NİĞDE">NİĞDE</option>
										<option value="ORDU">ORDU</option>
										<option value="OSMANİYE">OSMANİYE</option>
										<option value="RİZE">RİZE</option>
										<option value="SAKARYA">SAKARYA</option>
										<option value="SAMSUN">SAMSUN</option>
										<option value="SİİRT">SİİRT</option>
										<option value="SİNOP">SİNOP</option>
										<option value="SİVAS">SİVAS</option>
										<option value="ŞANLIURFA">ŞANLIURFA</option>
										<option value="ŞIRNAK">ŞIRNAK</option>
										<option value="TEKİRDAĞ">TEKİRDAĞ</option>
										<option value="TOKAT">TOKAT</option>
										<option value="TRABZON">TRABZON</option>
										<option value="TUNCELİ">TUNCELİ</option>
										<option value="URFA">URFA</option>
										<option value="UŞAK">UŞAK</option>
										<option value="VAN">VAN</option>
										<option value="YALOVA">YALOVA</option>
										<option value="YOZGAT">YOZGAT</option>
										<option value="ZONGULDAK">ZONGULDAK</option></select><span
										class="select2 select2-container select2-container--default"
										dir="ltr" data-select2-id="3" style="width: auto;"><span
										class="selection"><span
											class="select2-selection select2-selection--single"
											role="combobox" aria-haspopup="true" aria-expanded="false"
											tabindex="0" aria-disabled="false"
											aria-labelledby="select2-s0-0-0-10-95-100-101-select-container"><span
												class="select2-selection__rendered"
												id="select2-s0-0-0-10-95-100-101-select-container"
												role="textbox" aria-readonly="true"><span
													class="select2-selection__placeholder">İl</span></span><span
												class="select2-selection__arrow" role="presentation"><b
													role="presentation"></b></span></span></span><span class="dropdown-wrapper"
										aria-hidden="true"></span></span>
									<div class="m-select-error" id="select-city-error"></div>
								</div>
							</div>
							<div class="m-form-group">
								<div class="m-form-group__child">
									<select class="m-select js-district select2-hidden-accessible"
										data-placeholder="İlçe"
										data-parsley-errors-container="#select-district-error"
										data-parsley-error-message="Bu alan boş bırakılamaz."
										required="" name="s0-0-0-10-95-102-103-select"
										id="s0-0-0-10-95-102-103-select"
										data-select2-id="s0-0-0-10-95-102-103-select" disabled=""
										tabindex="-1" aria-hidden="true"></select><span
										class="select2 select2-container select2-container--default select2-container--disabled"
										dir="ltr" data-select2-id="4" style="width: auto;"><span
										class="selection"><span
											class="select2-selection select2-selection--single"
											role="combobox" aria-haspopup="true" aria-expanded="false"
											tabindex="-1" aria-disabled="true"
											aria-labelledby="select2-s0-0-0-10-95-102-103-select-container"><span
												class="select2-selection__rendered"
												id="select2-s0-0-0-10-95-102-103-select-container"
												role="textbox" aria-readonly="true"><span
													class="select2-selection__placeholder">İlçe</span></span><span
												class="select2-selection__arrow" role="presentation"><b
													role="presentation"></b></span></span></span><span class="dropdown-wrapper"
										aria-hidden="true"></span></span>
									<div class="m-select-error" id="select-district-error"></div>
								</div>
							</div>
							<div class="js-hidden-fields">
								<div class="service-point">
									<div class="service-point__name">3A PAZARLAMA/ATİKOP ŞUBE</div>
									<div class="service-point__person">AHMET EŞİN</div>
									<div class="service-point__address">TURAN CEMAL BERİKER
										BULV.ADANA İŞ MERKEZİYANI NO:457 İSOTLAR BP İSTASYON</div>
								</div>
								<div class="service-point">
									<div class="service-point__name">3A PAZARLAMA/ATİKOP ŞUBE</div>
									<div class="service-point__person">AHMET EŞİN</div>
									<div class="service-point__address">TURAN CEMAL BERİKER
										BULV.ADANA İŞ MERKEZİYANI NO:457 İSOTLAR BP İSTASYON</div>
								</div>
							</div>
							<div class="m-form-group">
								<div class="m-form-group__child">
									<a class="a-btn a-btn--full js-submit" href="javascript:;">Tamam</a>
								</div>
							</div>
						</form>
					</div>
					<a class="a-btn-icon btn-close" data-fancybox-close="true"
						href="javascript:;"><i class="icon-close"></i>ButtonIcon</a>
				</div>
				<div class="m-support" id="support">
					<div class="container">
						<h3>Yardım</h3>
						<div class="m-accordion m-accordion--plus">
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom nedir?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kopilot Filom şirketler için araçları ve sürücüleri ile
										ilgili bilgileri tek bir platformdan takip etme imkânı sunan,
										anlık veri ve detaylı raporlama sağlayan bir Turkcell
										servisidir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom ne işe yarar?</span>
								</div>
								<div class="m-accordion__body">
									<p>Filonuzdaki araçlarınızın tüm bilgilerine tek
										platformdan ulaşıp zamandan tasarruf edebileceğiniz gibi,
										araçlarınızla ilgili aldığınız bildirim, alarm ve raporlar ile
										filonuzu daha verimli ve güvenli yönetebilirsiniz. Sürüş
										sırasındaki ani hızlanma, sert fren, sert dönüş ve hız aşımı
										durumlarına göre sürüş skorunu takip ederek sürücülerin daha
										güvenli ve verimli sürüşe teşvik edilmesi sağlanabilir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Nasıl çalışır?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kopilot Filom’da, Kopilot Filom OBD ve Kopilot Filom BB
										olmak üzere iki cihaz seçeneği bulunmaktadır. Kopilot Filom
										OBD satın alındığında, kullanıcı aracının OBD2 portuna cihazı
										yerleştirir ve Kopilot Filom Platformuna tanımlı GSM numarası
										ile Hızlı Giriş yapılır. Kopilot Filom platformuna araç
										eklemesi yapılır ve araca yerleştirilen cihaz ile araç
										eşleştirilir. Kopilot Filom BB satın alınması durumunda
										cihazın araca montajı teknik servis tarafından yapılır,
										Kopilot Filom platformuna tanımlı GSM numarası ile Hızlı Giriş
										yapan kullanıcı aracını görüntüleyebilir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom’u nasıl satın alabilirim?</span>
								</div>
								<div class="m-accordion__body">
									<p>Turkcell Kopilot Filom servisinden faydalanmak için
										Turkcell Kurumsal Satış Yöneticiniz aracılığıyla Kopilot Filom
										cihazlarından satın alabilir ve cihaz içerisindeki ya da cihaz
										ile birlikte temin edilecek Turkcell M2M hat ile Kopilot Filom
										tarifesine abone olabilirsiniz.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Ne kadar öderim?</span>
								</div>
								<div class="m-accordion__body">
									<p>Turkcell Kopilot Filom servisinden faydalanmak için
										Kopilot Filom tarifesine abone olmanız gereklidir. Kopilot
										Filom tarifesine; Kopilot Filom kampanyasından faydalanarak 24
										ay taahhütlü olarak vergiler dahil aylık 17,90 TL'ye abone
										olabilirsiniz. Fiyatlara KDV ve ÖİV dahildir. 01.01.2020 -
										31.03.2020 tarihleri arasında Kopilot Filom kampanyasına
										katılınması durumunda ilk 3 ay Kopilot Filom Tarife bedeli
										ücretsizdir. 4. fatura döneminden başlamak üzere ücretlendirme
										yapılacaktır.</p>
									<p>Taahhütsüz Kopilot Filom tarifesi vergiler dahil aylık
										24,90TL ‘dir. Kopilot Filom servisini kullanabilmek için
										ihtiyacınız olan, aracınızın servis bağlantı girişine (OBD
										port) takacağınız Kopilot Filom OBD ya da teknik servis
										tarafından montajını yaptıracağınız Kopilot Filom BB cihazını
										Turkcell Müşteri Yöneticiniz aracılığıyla Kopilot Filom
										kampanyası ile satın alabilirsiniz.</p>
									<img src="../../assets/images/content/new-faq-img-1.jpg">
									<p>Kopilot Filom Kampanyasının 24 aylık taahhüt süresi
										dolmadan iptali durumunda, ilgili cayma bedeli hesaplanarak
										Turkcell faturasına yansıtılır. Kopilot Filom kampanyası 24
										aylık taahhüt süresi sonunda sona erer ve taahhütsüz tarife
										üzerinden servis aboneliği devam eder.</p>
									<p>Taahhütsüz Kopilot Filom tarifesi iptal edilmediği
										sürece aylık otomatik olarak yenilenir ve servisten
										faydalanmaya devam edersiniz.</p>
									<p>Data Paketi’nin ilgili ay içerisinde aşılması halinde;
										aşım sonrası data kullanımları Kurumsal M2M Ürün Tarifesi
										üzerinden hesaplanarak ücretlendirilir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom Kampanyasından Kimler
										Yararlanabilir?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kampanyadan Kopilot Filom Tarifesini kullanan Kurumsal
										M2M Hat sahipleri yararlanabilmektedir. Kopilot Filom cihazını
										kampanya ile alabilmeniz için Limit Puan Uygulaması
										yeterliliğinin sağlanmış olması beklenmektedir. Limit Puan
										Uygulaması kapsamında firmanız adına kayıtlı tüm hatlardaki
										kullanım ve ödeme alışkanlıklarınız değerlendirilerek firmanız
										adına bir limit puan belirlenir. Seçtiğiniz cihaz tekliflerine
										sahip olmak için limit puanınızın, en az kampanya kapsamında
										sunulan cihaz için belirlenmiş limit puan kadar olması
										gereklidir. Kopilot Filom cihazı için geçerli limit puan ile
										ilgili Turkcell Kurumsal Müşteri Yöneticinizden bilgi
										alabilirsiniz.</p>
									<p>Bununla beraber, Cihaz Limit Puanınız yeterli olsa dahi,
										son ödeme tarihi geçmiş ama ödenmemiş faturanızın bulunmaması,
										firma adına kayıtlı hatlardan hiçbirinin abonelik sözleşmesine
										aykırı durumlar sebebiyle kapalı olmaması ve yine aynı firma
										adına kayıtlı hatlardan herhangi biri için, önceden katılıp
										kontrat süresinden önce iptal gerçekleştiği için hesaplanıp
										fatura edilmiş ancak ödenmemiş cayma bedeli bulunmaması
										gereklidir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Servisi yurt dışında da kullanabilir miyim?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kopilot Filom tarifesi yurt dışında geçerli değildir.
										Kopilot Filom servisinin yurt dışında kullanılması durumunda
										Turkcell M2M Akıllı Yurt Dışı Dünyası Tarifesi'ne göre
										ücretlendirme yapılır ve faturanıza ayrıca yansıtılır.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Nasıl İptal ederim?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kopilot Filom servisini iptal etmek için Turkcell
										Müşteri Yöneticiniz ile iletişime geçebilirsiniz.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Numara değişikliği, devir, faturasız hatta
										geçiş, numara taşıma, borç nedeniyle hattın kapanması, kendi
										isteğiyle hat kapama veya fatura dönem değişikliğinde
										aboneliğim devam eder mi?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kopilot Filom servisini kullanabilmeniz için aracınıza
										taktığınız cihaz içerisindeki hattın Kopilot Filom tarifesine
										aboneliğinin olması ve hattın aktif olması gerekmektedir.
										Numara değişikliği, devir, faturasız hatta geçiş, tarife
										değişikliği durumlarında Kopilot Filom aboneliğiniz sona erer
										ve kampanyadan faydalanıyorsanız ilgili cayma bedeli
										faturanıza yansıtılır. Hattın kapanması durumunda servis
										kullanımınız durdurulur, hattınızın tekrar açılması ile
										servisi kullanmaya devam edebilirsiniz. Fatura dönem
										değişikliğinde aboneliğiniz etkilenmez ve servisi kullanmaya
										devam edebilirsiniz.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom platformuna/arayüzüne nasıl
										ulaşabilirim?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kopilotfilom.turkcell.com.tr adresine giriş yaparak
										ulaşabilirsiniz.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom’a sonradan araç ekleme
										yapabilir miyim?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kopilot Filom servisine istediğiniz kadar araç eklemesi
										yaparak araçlarınızı takip edebilirsiniz. Her bir araç
										eklemesi için ek bir cihaz satın almanız ve içerisindeki/ayrı
										temin edilen M2M hat ile Kopilot Filom tarifesine abone
										olmanız gerekmektedir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom OBD kullanımında araç
										çeşidinde bir limitleme var mı?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kopilot Filom OBD; OBD2 standardına uygun
										geliştirilmiştir. Araçların OBD2 portuna (servis bağlantı
										girişine) takılan cihaz üzerinden alınan veriler kullanılarak
										çalıştığından, cihazın takılacağı aracın OBD portunun sorunsuz
										ve OBD2 standardına uygun olması önemlidir. Aracınızda
										halihazırda veya ek bir ekipman olarak bulunan uzaktan
										çalıştırma, tekerlekli sandalye asansörü gibi donanımlar
										sebebiyle cihazınız aracınıza uyumlu olmayabilir. Kopilot
										Filom OBD cihazı OBD2 standartlarına uyumlu olmakla beraber
										aracınızın marka, model ve yılına özgü spesifik iletişim
										protokolleri kullanılan özel durumlar ve yerleşim kaynaklı
										sorunlardan dolayı tüm fonksiyonları beklenilen performans
										seviyesinde çalışmayabilir, Kopilot Filom OBD cihazı farklı
										marka ve modeldeki araçlarda test edilmiştir.
										www.turkcell.com.tr/kurumsal/kurumsal-cozumler/kopilot-filom
										adresinden, yapılan testlere göre oluşturulan listeden
										aracınızın marka ve modeline göre Kopilot Filom OBD ile uyumlu
										olup olmadığını kontrol edebilirsiniz.</p>
									<p>Kopilot Filom OBD cihazının 2011 model öncesinde
										üretilen araçlara uyumluluğu garanti edilmemektedir. 2011
										model sonrası araçlarda turkcell.com.tr’de cihazın aracınıza
										uyumlu olduğu belirtilmesine rağmen cihazın aracınıza uyumlu
										olmadığı tespit edildiği takdirde iade süreci uygulanır.</p>
									<p>2011 model üzeri araç ile cihaz listede uyumlu
										gözükmesine rağmen eğer kullanıcı cihazdan sağlıklı şekilde
										yararlanamaz (cihazda bir veya birden fazla fonksiyon
										çalışmıyor) ise öncelikle çağrı merkezine sorun iletilmelidir.
										Çağrı merkezinde yapılacak kontroller sonrası teknik servis
										incelemesi gerekirse cihaz teknik servise gönderilmelidir.
										Teknik servis tarafından cihazın araç ile uyumsuz olduğuna
										karar verilirse iade süreci başlatılır.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom OBD cihazı araca nasıl
										takılıyor?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kopilot Filom OBD cihazı montaj gerektirmeyen kullanıcı
										tarafından kolayca takılabilecek bir üründür. Ürünü kutusundan
										çıkarıp aracınız çalışır durumda ve açık havada iken aracın
										OBD2 girişine takıp kullanmaya başlayabilirsiniz. OBD2 girişi
										araç marka modellerinde değişiklik göstermektedir.</p>
									<p>
										<a href="#" data-fancybox="true" data-modal="true"
											data-src="#modal-port-whereabouts"
											data-base-class="fancybox-compatible">OBD portunun nerede
											olduğunu öğrenmek için tıklayınız</a>
									</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom OBD cihazı kolayca
										sökülebilir mi?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kopilot Filom OBD ürününde teknik servis desteği
										gerekmeksizin kolayca takıp çıkarma işlemleri yapılabilir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom OBD cihazı başka bir araca
										takılabilir mi?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kopilot Filom OBD cihazınızı aracınızdan çıkardıktan
										sonra başka bir araçta kullanabilirsiniz. Aracı
										değiştirdiğinizde Kopilot Filom platform üzerinden aracın
										bilgilerini güncellemeniz gerekmektedir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom OBD cihazını şarj etmek
										gerekiyor mu?</span>
								</div>
								<div class="m-accordion__body">
									<p>Cihaz çalışması için gerekli olan enerjiyi aracınızdan
										almaktadır. Ayrıca şarj edilmemektedir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom OBD cihazının üzerindeki
										ışıkların anlamı nedir?</span>
								</div>
								<div class="m-accordion__body">
									<p>Güç ışığının yeşil yanması cihazda güç olduğunu ve
										çalıştığını göstermektedir. Sinyal ışığının üç saniyede bir
										kez yeşil yanması cihazın sağlıklı çalıştığını ve bağlantısı
										olduğunu göstermektedir.</p>
									<img src="../../assets/images/content/new-faq-img-2.jpg">
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom OBD cihazı arabama zarar
										verir mi?</span>
								</div>
								<div class="m-accordion__body">
									<p>Cihaz yüksek kalite standartlarında ve CE sertifikalı
										Avrupa normlarına uygun olarak üretilmiştir. E-Mark belgesine
										sahiptir, araç bileşenleriyle elektromanyetik uyumluluğu test
										edilerek onaylanmıştır.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot filom OBD cihazının garanti süresi
										nedir?</span>
								</div>
								<div class="m-accordion__body">
									<p>Garanti süresi 2 yıldır. Garanti dışında teknik serviste
										yapılan işlemlerde ödemenin teknik servisin merkezine havale
										ile yapılması ve dekont alınması önerilmektedir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom BB cihazı kullanımda araç
										çeşidinde bir limitleme var mı?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kopilot Filom BB cihazı tüm marka model araçlarla uyumlu
										olarak çalışmaktadır.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom BB cihazı araca nasıl
										takılıyor?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kopilot Filom BB cihazınızı satın aldıktan sonra montaj
										servisi için sizinle iletişime geçilecektir. Aracınıza
										cihazınızın montajının yapılması için randevunuzu
										oluşturduktan sonra montaj hizmeti gerçekleştirilecektir. Aynı
										anda 5(beş) cihaz ve üzeri montaj işlemi söz konusu ise
										anlaşmalı servis firmasının gezici servisleri tarafından kendi
										lokasyonunuzda montaj yapılabilir, 5(beş)’in altında cihaz
										için ise anlaşmalı firmanın servis noktalarının bulunduğu
										adreslere giderek cihaz ve sim kartınızın montajını
										yaptırabilirsiniz.</p>
									<p>
										<a href="#" data-fancybox="true" data-modal="true"
											data-src="#modal-service-points"
											data-base-class="fancybox-compatible">İl-İlçe servis
											noktalarını incelemek için tıklayınız.</a>
									</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom BB cihazının montajı ücretli
										mi?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kopilot Filom BB cihazlarınız için ilk montaj hizmeti
										ücretsiz olarak yapılmaktadır. İlk montaj sonrasında yapılan
										her bir montaj sökme işlemi için 45TL+KDV, her bir montaj
										işlemi için 45TL+KDV ücret müşteri tarafından ödenmesi
										gerekmektedir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom BB cihazı kolayca sökülebilir
										mi?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kopilot Filom BB cihazı araç içerisinde kolay
										ulaşılabilir bir noktada bulunmamaktadır. Teknik servis
										desteği olmadan çıkarılması önerilmemektedir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom BB cihazı başka araca
										takılabilir mi?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kopilot Filom BB cihazınızı teknik serviste montaj sökme
										işlemi yaptırdıktan sonra başka bir aracınıza montajını
										yaptırabilirsiniz. Teknik servis desteği olmadan işlem
										yapılmaması önerilmektedir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom BB cihazını şarj etmek
										gerekiyor mu?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kopilot Filom BB cihazınız çalışması için gerekli olan
										enerjiyi aracınızdan almaktadır. Ayrıca şarj edilmemektedir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot filom BB cihazının garanti süresi
										nedir?</span>
								</div>
								<div class="m-accordion__body">
									<p>Garanti süresi 2 yıldır. Garanti dışında teknik serviste
										yapılan işlemlerde ödemenin havale ile yapılması ve dekont
										alınması önerilmektedir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom cihazları ile arabamın
										kilidini açabilir veya motorunu çalıştırabilir miyim?</span>
								</div>
								<div class="m-accordion__body">
									<p>Cihazlarımız aracınızdan sadece gerekli verileri
										toplamaktadır. Güvenlik sebebiyle aracınıza kilit açma, motor
										çalıştırma vb. komutlar göndermemektedir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom cihazların veri aktarımında
										internet kotası mevcut mudur?</span>
								</div>
								<div class="m-accordion__body">
									<p>Cihazınızdaki Turkcell hattınızda aylık 500 MB internet
										paketi tanımlıdır ve cihazınızdaki veri aktarımı için
										yeterlidir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom Platformuna nasıl giriş
										yapabilirim?</span>
								</div>
								<div class="m-accordion__body">
									<p>Sisteme ilk giriş Kopilot Filom ürün sorumlusu olarak
										tanımlanan GSM Numarası ile yapılabilir. Ürün sorumlusu
										Turkcell Kurumsal Müşteri Temsilciniz tarafından
										tanımlanmaktadır. Ürün sorumlusu tanımlı GSM Numarası ile
										giriş yaptıktan sonra alt kullanıcılar tanımlayabilirsiniz.
										Alt kullanıcı tanımlamaları yapıldıktan sonra sisteme
										tanımlanan kullanıcı, GSM Numarası ile giriş sağlayabilir.
										Girişler sırasında Turkcell Hızlı Giriş kullanılır.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Hızlı Giriş nedir?</span>
								</div>
								<div class="m-accordion__body">
									<p>Hızlı Giriş, Dünya Operatörler Birliği tarafından
										sağlanan Mobile Connect servisiyle uyumlu ve uluslararası bir
										çözümdür. Kullanıcıların web sitesinde Hızlı Giriş yapmak
										istediği cep telefonu numaralarını yazmaları, ardından cep
										telefonlarına gelen ekran üzerinden onaylamaları ya da cep
										telefonlarına gelen şifre ile sisteme giriş yapmaları
										gerekmektedir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Kopilot Filom arayüz hangi tarayıcılar ile
										çalışır?</span>
								</div>
								<div class="m-accordion__body">
									<p>Internet Explorer 11, Edge, Chrome 69 üzeri, Safari 10
										üzeri, Opera 55 üzeri, Firefox60 üzeri tarayıcılar ile
										çalışmaktadır.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Sisteme neden giriş yapamıyorum?</span>
								</div>
								<div class="m-accordion__body">
									<p>Firma yetkilisi iseniz; ürün sorumlusu bilgileriniz
										hatalı girilmiş olabilir, güncellemek için Turkcell Kurumsal
										Müşteri Temsilciniz ile iletişime geçebilirsiniz. Alt
										kullanıcı iseniz; bilgileriniz kaydedilmemiş olabilir,
										bilgilerinizi kontrol etmek için firma yetkiliniz ile
										iletişime geçebilirsiniz.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Anlık durumlar – araç sayısı nedir?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kopilot Filom servisine bağlı yetkiniz olan bütün
										araçların anlık olarak durma, rölanti ve hareketli olma
										durumları araç sayısı bazında görüntülenmektedir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Anlık durumlarda bulunan renklerin
										anlamları nedir?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kırmızı durmakta olan, turuncu rölantide bekleyen, yeşil
										ise hareket halinde olan araçları göstermektedir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Aktivite Özeti nedir?</span>
								</div>
								<div class="m-accordion__body">
									<p>Aktivite özeti belirlenen süre aralığında araçların
										toplam yaptığı yol bilgilerini, hareket durumlarını yüzdesel
										olarak gösteren alandır. Bu alanda kullanıcı bugün, dün, son
										bir hafta ve son bir aylık verilere ulaşabilmektedir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Araçlarımın hepsini haritada görüntülemek
										istiyorum, nasıl görüntüleyebilirim?</span>
								</div>
								<div class="m-accordion__body">
									<p>Ana menüden takip ekranına geldiğinizde araçlarınızın
										son durumdaki konum bilgileri ile birlikte harita üzerinde
										görüntüleme sağlayabilirsiniz.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Araç listemi nasıl görüntüleyeceğim?</span>
								</div>
								<div class="m-accordion__body">
									<p>Ana menüden takip ekranına geldiğinizde sol üstte
										bulunan ‘liste’ butonuna basıp araçlarınızın liste görünümüne
										geçebilirsiniz.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Araçlarımı haritada neden
										görüntüleyemiyorum?</span>
								</div>
								<div class="m-accordion__body">
									<p>Araçlarınız sisteme tanımlanmamış veya kullanıcınıza
										tanımlı olmayabilir, tanımlamaların doğru yapıldığını kontrol
										edin. Araçlarınız cihazınızı taktıktan sonra kullanılmamış ise
										sistem üzerinde görüntüleyemezsiniz. Aracınızın ilk seyahatini
										tamamladığından emin olun.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Aracımın detaylı bilgisini nasıl
										görüntüleyebilirim?</span>
								</div>
								<div class="m-accordion__body">
									<p>Takip ekranında herhangi bir aracın üzerine
										tıkladığınızda açılacak olan araç kartında araç bilgilerinizi
										görüntüleyebilirsiniz.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Aracımın hangi bilgilerini
										görüntüleyebilirim?</span>
								</div>
								<div class="m-accordion__body">
									<p>Takip ekranında harita veya liste görünümünde aracın
										üzerine gelindiğinde açılan araç kartında araca ait plaka,
										sürücü adı, günlük hareket, rölanti ve durma oranları, anlık
										durumu, son alınan konumu, son hareket tarihi ve saati
										verilerine ulaşabilirsiniz.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Sürüş puanı nedir?</span>
								</div>
								<div class="m-accordion__body">
									<p>Sürüş karakteristiğinize bağlı hız aşımı, ani hızlanma,
										sert fren ve sert dönüşler için güvenlik puanlaması
										yapılmaktadır. Sürüş güvenliği puanının yüksek olması kaza
										riskini düşük olduğunu gösterir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>İhlal sayısı nedir?</span>
								</div>
								<div class="m-accordion__body">
									<p>Hız aşımı, sert fren, ani hızlanma, sert dönüş, bölge ve
										adres ihlali durumları birer ihlal olarak sayılmaktadır. İhlal
										sayısı bugün, dün, son bir hafta ve son bir ay için toplam
										sayıyı göstermektedir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Geçmişe ait verileri görebilir miyim?</span>
								</div>
								<div class="m-accordion__body">
									<p>Rapor fonksiyonu ile geçmişe ait verilerin raporları
										alınabilir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Bildirim ile alarmın farkı nedir?</span>
								</div>
								<div class="m-accordion__body">
									<p>Bildirimler Kopilot Filom cihazının aracınızdan
										topladığı verilere göre oluşur, önceden tanımlama gerektirmez.
										Örneğin; akü düşük uyarısı. Alarmlar kullanıcı bazlı olup
										yalnızca tanımlandığı araçlarda oluşan durumları gösterir.
										Örneğin; Bölge Giriş/Çıkış Alarmı.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Bildirimlerimi nasıl görebilirim?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kopilot Filom arayüz üzerinde ana sayfada sağ üstte
										bulunan çan sembolüne basıldığında kullanıcı yetkili olduğu
										araçlardan gelen bildirimleri görebilir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Bildirim tipleri nedir?</span>
								</div>
								<div class="m-accordion__body">
									<p>Çekilme uyarısı, kaza bildirimi, yüksek motor sıcaklığı
										bildirimi, düşük akü voltajı bildirimi ve hata kodu bildirimi
										Kopilot Filom servisinde cihazınız aracılığıyla alınan ve
										arayüzde görüntüleyebileceğiniz bildirim tipleridir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Bildirim ayarlarını nereden yapabilirim?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kullanıcı bildirim ayarlarına Yönetim alanından bildirim
										ayarları sekmesinden ulaşılabilir. Bildirim ayarları filo
										bazında açılıp kapanabilmektedir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Oluşan alarmlarımı nasıl görebilirim?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kopilot Filom arayüz üzerinde sol menüde bulunan
										Alarmlar alanına tıklayarak kullanıcı kendi filosuna ait
										araçlarda oluşan alarmları görebilir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Alarm tipleri nelerdir?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kullanıcı tarafından önceden tanımlanmış bölge giriş ve
										çıkışlarında verilen alarm, kullanıcı tarafından önceden
										tanımlanmış adresten geçme alarmı, belirlenen bir hız aşımında
										alınan alarm, sert fren ve ani hızlanma durumunda alınan
										alarmlar olarak gösterilmektedir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Alarmları nasıl tanımlayabilirim?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kullanıcı, sol menüden Yönetim ekranlarına geçip, bu
										ekran üzerinde bulunan alarmlar sekmesinde yeni bir alarm
										tanımlayabilir. Alarm tanımlamak için en az bir araç ve ihlal
										tipi seçilmelidir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Alarm tanımladıktan sonra geçmiş verilere
										dönük alarm alır mıyım?</span>
								</div>
								<div class="m-accordion__body">
									<p>Geçmişe dönük alarm tanımlanamaz, tanımlanan alarmlar
										tanımlandıkları tarihten sonra oluşursa kullanıcıya
										gönderilir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Yenileme hızı nedir?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kullanıcı platform üzerinde harita gibi anlık veri alan
										sayfaların yenilenme hızını belirleyebilir. Bu hız cihazlardan
										gelen verilerin hızını değil, kullanıcının ekranındaki
										yenilenme hızını değiştirebilmektedir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Yeni kullanıcı nasıl tanımlarım?</span>
								</div>
								<div class="m-accordion__body">
									<p>Kullanıcı ekleme işlemleri sisteme tanımlı sistem
										kullanıcısı ve/veya sistem alt kullanıcı tarafından
										yapılabilmektedir. Sistem alt kullanıcısı sadece standart
										kullanıcı ekleyebilmektedir. Ana menü üzerinden yönetim
										ekranında bulunan kullanıcılar sekmesinden yeni kullanıcı
										tanımlaması yapılabilir. Kullanıcılar tek tek
										tanımlanabileceği gibi örnek dosya indirilerek bu formatta
										hazırlanan dosyanın platforma yüklenmesi ile toplu olarak da
										tanımlanabilir.</p>
									<p>Kullanıcı tanımlanırken ad, soyad, e-posta adresi, GSM
										numarası, rol ve yetkili araç/grup tanımlanmalıdır. Her bir
										kullanıcı yalnızca yetkisi olan araç ve grupları
										görüntüleyebilir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Sistem Yöneticisi nedir?</span>
								</div>
								<div class="m-accordion__body">
									<p>Sistem yöneticisi Kopilot ürün sorumlusu bilgileri ile
										oluşturulan kullanıcıdır, filonun ana yöneticisidir. Bu
										kullanıcının bilgileri sadece çağrı merkezi aracılığıyla talep
										açılması doğrultusunda değiştirilebilir. Sistem yöneticisi
										bütün filoyu görüntüleyebilir, yönetim ekranlarından sistem
										alt yöneticisi ve standart kullanıcı oluşturabilir ve bu
										kullanıcılara istediği araçlar için yetki verebilir. Bölge ve
										adres tanımlamaları yapabilir. Alarm ve bildirim ayarlarını
										belirleyerek filo, grup veya araç bazında değişiklik
										yapabilir. Araç, sürücü ve grup tanımlayabilir. En üst yetkili
										kullanıcı tipidir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Sistem Alt Yönetici rolü nedir?</span>
								</div>
								<div class="m-accordion__body">
									<p>Sistem yöneticisi tarafından oluşturulan kullanıcı
										belirli bir grup, araç için atanabildiği gibi tüm filoyu
										kapsayacak şekilde de yetkilendirilebilir. Sistem alt
										yöneticisi bilgileri; sistem yöneticisi tarafından
										oluşturulduktan sonra değiştirilebilir. Sistem yöneticisinden
										farklı olarak sadece sistem yöneticisinin kendisine yetki
										verdiği grup veya araçlar için işlem yapabilmektedir. Yönetim
										ekranlarından kendisine yetki verilen araçları için bölge ve
										adres tanımlamaları yapabilir. Alarm tanımlayabilir ve
										bildirim ayarlarını yönetebilir. Araçları için raporları
										çekebilir, araçlarını haritada görüntüleyebilir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Standart Kullanıcı rolü nedir?</span>
								</div>
								<div class="m-accordion__body">
									<p>Sistem yöneticisi veya sistem alt yöneticisi tarafından
										oluşturulan bu kullanıcıdır. Kendisine yetki verilmiş olan
										araçları haritada görüntüleyebilir, raporlarını çekebilir.
										Araç bilgilerini ve ayarları değiştiremez, sürücü tanımlama
										yapamaz. En alt yetkili kullanıcı tipidir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Yeni araç nasıl tanımlarım?</span>
								</div>
								<div class="m-accordion__body">
									<p>Ana menü üzerinden yönetim ekranında bulunan araçlar
										sekmesinden yeni araç tanımlaması yapılabilir. Yeni araç
										tanımlaması tek tek yapılabileceği gibi örnek dosya
										indirilerek bu formatta hazırlanan dosyanın platforma
										yüklenmesi ile toplu olarak da yapılabilir.</p>
									<p>Araç eklemesi yapılırken bu aracın bağlı olacağı filo
										içerisindeki grup, aracın plakası, şasi no, aracın marka,
										model ve yıl bilgisi, aracın yakıt tipi ve araç tipi
										girilmelidir. Araç ekleme yapıldıktan sonra araçlar menüsünde
										bulunan cihaz ekle bölümünden daha önce kullanıcıya tanımlı
										Kopilot Filom OBD cihaz telefon numaraları arasından
										belirtilen araç için seçilen cihaz ile tanımlama
										tamamlanacaktır.</p>
									<p>Önceden tanımlı bir araca Kopilot Filom BB cihazının
										eklenmesi sadece montaj ile yapılabilmektedir. Bu işlem için
										teknik serviste aracınıza montaj yaptırmanız gerekmektedir.
										Cihaz ekleme işlemleri teknik servis tarafından yapılacaktır.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Aracımı neden silemiyorum?</span>
								</div>
								<div class="m-accordion__body">
									<p>Aracınıza bir cihaz bağlı ise aracınızı silemezsiniz.
										Aracınızı silmek için öncelikle bu araca bağlı cihazınızı
										ayırmanız gerekmektedir. Cihaz ayırma işlemi sonrasında araç
										silme butonu aktif hale gelecektir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Yeni sürücü nasıl tanımlarım?</span>
								</div>
								<div class="m-accordion__body">
									<p>Ana menü üzerinden yönetim ekranında bulunan sürücüler
										sekmesinden yeni sürücü tanımlaması yapılabilir. Yeni sürücü
										tanımlaması tek tek yapılabileceği gibi örnek dosya
										indirilerek bu formatta hazırlanan dosyanın platforma
										yüklenmesi ile toplu olarak da yapılabilir. Sürücü eklenmesi
										için sürücünün ad soyad bilgisi, cep telefonu numarası ve
										kullandığı araç bilgileri girilmelidir. Sürücü tanımlamasının
										yapılabilmesi için araç tanımlamasının önceden yapılması
										gerekmektedir.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Yeni grup nasıl tanımlarım?</span>
								</div>
								<div class="m-accordion__body">
									<p>Ana menü üzerinden yönetim ekranında bulunan gruplar
										sekmesinden yeni grup tanımlaması yapılabilir. Yeni grup
										tanımlaması tek tek yapılabileceği gibi örnek dosya
										indirilerek bu formatta hazırlanan dosyanın platforma
										yüklenmesi ile toplu olarak da yapılabilir.</p>
									<p>Grup eklenirken bağlı olduğu üst grup seçilmelidir. Üst
										grup yaratılmadan altına bir grup eklemesi gerçekleştirilemez.</p>
								</div>
							</div>
							<div class="m-accordion__container">
								<div class="m-accordion__head">
									<i></i><span>Öneri ve şikayetlerimi nasıl iletebilirim?</span>
								</div>
								<div class="m-accordion__body">
									<p>Öneri ve şikayetlerinizi Kopilot Filom ana menüsünde
										bulunan Yardım sayfası üzerinden “Bize Ulaşın” formunu
										doldurarak veya 0532 757 57 57 numarası ile çağrı merkezimizi
										arayarak iletebilirsiniz.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<footer class="o-footer">
					<div class="container">
						<div class="o-footer__menu">
							<a href="#" data-modal="true" data-fancybox="footer"
								data-src="#modal-port-whereabouts"
								data-base-class="fancybox-compatible">OBD Portu Nerede?</a><a
								href="#" data-modal="true" data-fancybox="footer"
								data-src="#modal-service-points"
								data-base-class="fancybox-compatible">Servis Noktaları</a>
						</div>
					</div>
				</footer>
				<div id="modal-port-whereabouts" class="m-modal m-modal--compatible"
					data-component="[object Object]">
					<div class="m-modal__body">
						<h3>OBD Portum Nerede?</h3>
						<form data-url="../../assets/data/VehicleList.json">
							<div class="m-form-group">
								<div class="m-form-group__child">
									<select class="m-select js-brand select2-hidden-accessible"
										data-placeholder="Marka"
										data-parsley-errors-container="#select01-error"
										data-parsley-error-message="Bu alan boş bırakılamaz."
										required="" name="s0-0-0-12-5-9-10-select"
										id="s0-0-0-12-5-9-10-select"
										data-select2-id="s0-0-0-12-5-9-10-select" tabindex="-1"
										aria-hidden="true"><option value=""
											data-select2-id="9">Marka</option>
										<option value="alfa-romeo">Alfa Romeo</option>
										<option value="aston-martin">Aston Martin</option>
										<option value="audi">Audi</option>
										<option value="bmw">BMW</option>
										<option value="fiat">Fiat</option>
										<option value="bentley">Bentley</option>
										<option value="bugatti">Bugatti</option>
										<option value="cadillac">Cadillac</option>
										<option value="chery">Chery</option>
										<option value="chevrolet">Chevrolet</option>
										<option value="chrysler">Chrysler</option>
										<option value="citroen">Citroen</option>
										<option value="dacia">Dacia</option>
										<option value="daihatsu">Daihatsu</option>
										<option value="dodge">Dodge</option>
										<option value="ferrari">Ferrari</option>
										<option value="ford">Ford</option>
										<option value="geely">Geely</option>
										<option value="honda">Honda</option>
										<option value="hummer">Hummer</option>
										<option value="hyundai">Hyundai</option>
										<option value="Ikco">Ikco</option>
										<option value="Infiniti">Infiniti</option>
										<option value="Jaguar">Jaguar</option>
										<option value="Jeep">Jeep</option>
										<option value="Kia">Kia</option>
										<option value="Koenigsegg">Koenigsegg</option>
										<option value="Ktm">Ktm</option>
										<option value="Lada">Lada</option>
										<option value="Lamborghini">Lamborghini</option>
										<option value="Lancia">Lancia</option>
										<option value="Land Rover">Land Rover</option>
										<option value="Lexus">Lexus</option>
										<option value="Lincoln">Lincoln</option>
										<option value="Maserati">Maserati</option>
										<option value="Maybach">Maybach</option>
										<option value="Mazda">Mazda</option>
										<option value="Mercedes">Mercedes</option>
										<option value="Mercury">Mercury</option>
										<option value="Mini">Mini</option>
										<option value="Mitsubishi">Mitsubishi</option>
										<option value="Nissan">Nissan</option>
										<option value="Opel">Opel</option>
										<option value="Peugeot">Peugeot</option>
										<option value="Porsche">Porsche</option>
										<option value="Proton">Proton</option>
										<option value="Range Rover">Range Rover</option>
										<option value="Renault">Renault</option>
										<option value="Saab">Saab</option>
										<option value="Seat">Seat</option>
										<option value="Skoda">Skoda</option>
										<option value="Smart">Smart</option>
										<option value="Ssangyong">Ssangyong</option>
										<option value="Subaru">Subaru</option>
										<option value="Suzuki">Suzuki</option>
										<option value="Tata">Tata</option>
										<option value="Tesla">Tesla</option>
										<option value="Toyota">Toyota</option>
										<option value="Volkswagen">Volkswagen</option>
										<option value="Volvo">Volvo</option>
										<option value="Isuzu">Isuzu</option></select><span
										class="select2 select2-container select2-container--default"
										dir="ltr" data-select2-id="5" style="width: auto;"><span
										class="selection"><span
											class="select2-selection select2-selection--single"
											role="combobox" aria-haspopup="true" aria-expanded="false"
											tabindex="0" aria-disabled="false"
											aria-labelledby="select2-s0-0-0-12-5-9-10-select-container"><span
												class="select2-selection__rendered"
												id="select2-s0-0-0-12-5-9-10-select-container"
												role="textbox" aria-readonly="true"><span
													class="select2-selection__placeholder">Marka</span></span><span
												class="select2-selection__arrow" role="presentation"><b
													role="presentation"></b></span></span></span><span class="dropdown-wrapper"
										aria-hidden="true"></span></span>
									<div class="m-select-error" id="select01-error"></div>
								</div>
							</div>
							<div class="m-form-group">
								<div class="m-form-group__child">
									<select class="m-select js-model select2-hidden-accessible"
										data-placeholder="Model"
										data-parsley-errors-container="#select01-error"
										data-parsley-error-message="Bu alan boş bırakılamaz."
										required="" name="s0-0-0-12-5-11-12-select"
										id="s0-0-0-12-5-11-12-select"
										data-select2-id="s0-0-0-12-5-11-12-select" disabled=""
										tabindex="-1" aria-hidden="true"></select><span
										class="select2 select2-container select2-container--default select2-container--disabled"
										dir="ltr" data-select2-id="6" style="width: auto;"><span
										class="selection"><span
											class="select2-selection select2-selection--single"
											role="combobox" aria-haspopup="true" aria-expanded="false"
											tabindex="-1" aria-disabled="true"
											aria-labelledby="select2-s0-0-0-12-5-11-12-select-container"><span
												class="select2-selection__rendered"
												id="select2-s0-0-0-12-5-11-12-select-container"
												role="textbox" aria-readonly="true"><span
													class="select2-selection__placeholder">Model</span></span><span
												class="select2-selection__arrow" role="presentation"><b
													role="presentation"></b></span></span></span><span class="dropdown-wrapper"
										aria-hidden="true"></span></span>
									<div class="m-select-error" id="select01-error"></div>
								</div>
							</div>
							<div class="port-location js-port-location">
								<p>OBD portunuz görseldeki konumda yer almaktadır.</p>
								<figure>
									<img>
								</figure>
							</div>
							<div class="m-form-group">
								<div class="m-form-group__child">
									<a class="a-btn a-btn--full js-submit" href="javascript:;">Tamam</a>
								</div>
							</div>
						</form>
					</div>
					<a class="a-btn-icon btn-close" data-fancybox-close="true"
						href="javascript:;"><i class="icon-close"></i>ButtonIcon</a>
				</div>
			</main>
			<div id="modal-video" class="m-modal m-modal--video">
				<a class="a-btn-icon btn-close" data-fancybox-close="true"
					href="javascript:;"><i class="icon-close"></i>ButtonIcon</a>
			</div>
			<script id="modal-video-html" type="text/x-handlebars-template"><div class="m-modal__body"><iframe src="https://www.youtube.com/embed/BcCgrJFV7Gs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe></div></script>
		</div>
	</div>
	<div id="portal"></div>

</body>