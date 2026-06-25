---
layout: page
title: Início
permalink: /
nav: false
news: true
selected_papers: false
social: false
---

<link rel="stylesheet" href="{{ '/assets/css/custom.css' | relative_url }}">

<style>
  /* Oculta o header padrão para o design Keynote iniciar no topo */
  .post-header {
    display: none !important;
  }
  
  /* Oculta os logotipos de Realização do rodapé apenas nesta página inicial,
     evitando duplicidade já que a seção está presente no corpo da página */
  footer.sticky-bottom::before,
  footer.sticky-bottom .container::before {
    display: none !important;
  }
</style>

<!-- Hero Section (Keynote Style) -->
<div class="kn-hero">
    <div class="kn-hero-grid"></div>
    <div class="kn-hero-content">
        <!-- Local e Data do Evento -->
        <p class="kn-date-loc">
            📍 17 a 23 de Outubro de 2026 &bull; Balsas, MA
        </p>
        <!-- Event Brand Icon -->
        <div class="kn-hero-logo-wrapper">
            <img src="{{ '/assets/img/icone.png' | relative_url }}" alt="Ícone CONTEC" class="kn-hero-logo" />
        </div>
        
        <!-- Badge de Destaque 
        <a href="{{ '/submissao/' | relative_url }}" class="kn-badge">
            <span class="kn-badge-dot"></span>
            <span>Submissões prorrogadas até 28 de agosto!</span>
        </a> -->
        
        
        <!-- Título Principal -->
        <h1 class="kn-title">
            <span>III CONTEC MATOPIBA</span>
        </h1>
        
        <!-- Tema / Subtítulo -->
        <p class="kn-subtitle">
            Saberes conectados para a resolução de problemas complexos
        </p>
        
        <!-- Descrição Rápida -->
                
        <!-- CTAs focados em Mobile -->
        <div class="kn-cta-group">
            <a href="{{ '/inscricoes/' | relative_url }}" class="kn-btn-primary">
                Inscrição Gratuita
            </a>
            <a href="{{ '/submissao/' | relative_url }}" class="kn-btn-secondary">
                Enviar Trabalho
            </a>
        </div>
    </div>
</div>

<!-- Countdown Timer (Glassmorphic Banner) -->
<div class="countdown-section" id="countdown-banner">
    <div class="countdown-wrapper">
        <div class="countdown-info">
            <h3 class="text-xl font-extrabold tracking-tight text-slate-900 dark:text-white mb-1">Começa em:</h3>
            <p class="text-sm text-slate-500 dark:text-slate-400">Contagem regressiva até a primeira Visita Técnica (17/10 às 08h00).</p>
        </div>
        <div class="countdown-timer">
            <div class="timer-block">
                <span class="timer-number" id="days">00</span>
                <span class="timer-label">Dias</span>
            </div>
            <div class="timer-block">
                <span class="timer-number" id="hours">00</span>
                <span class="timer-label">Horas</span>
            </div>
            <div class="timer-block">
                <span class="timer-number" id="seconds">00</span>
                <span class="timer-label">Seg</span>
            </div>
        </div>
    </div>
</div>

<!-- Welcome Introduction Text -->
<div class="max-w-4xl mx-auto text-slate-700 dark:text-slate-300 text-center sm:text-left mb-12">
    <p class="text-base sm:text-lg leading-relaxed mb-4">
        Seja muito bem-vindo ao portal oficial do <strong>III Congresso de Tecnologia, Engenharia e Ciência (CONTEC MATOPIBA)</strong>! O evento é uma iniciativa do Centro de Ciências de Balsas da Universidade Federal do Maranhão (UFMA) com o propósito de integrar ensino, pesquisa, extensão e inovação sob a perspectiva do desenvolvimento regional.
    </p>
    <p class="text-base sm:text-lg leading-relaxed">
        Realizado no Centro de Ciências da Balsas (MA).</p>
</div>

<!-- Quick Navigation Highlights (4 Cards Grid) -->
<div class="kn-quick-grid">
    <a href="{{ '/inscricoes/' | relative_url }}" class="kn-quick-card">
        <div class="kn-quick-icon">
            <svg fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M16.5 6v.75m0 3v.75m0 3v.75m0 3V18m-9-12h12c1.38 0 2.5 1.12 2.5 2.5v1.5a1.5 1.5 0 000 3v1.5c0 1.38-1.12 2.5-2.5 2.5H7.5A2.5 2.5 0 015 15.5v-1.5a1.5 1.5 0 000-3v-1.5A2.5 2.5 0 017.5 6z"></path>
            </svg>
        </div>
        <h3 class="kn-quick-title">Inscrições Gratuitas</h3>
        <p class="kn-quick-desc">Garanta sua vaga pelo SIGEventos UFMA.</p>
    </a>
    
    <a href="{{ '/submissao/' | relative_url }}" class="kn-quick-card">
        <div class="kn-quick-icon">
            <svg fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9.663 17h4.673M12 3v1m6.364.364l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z"></path>
            </svg>
        </div>
        <h3 class="kn-quick-title">7 Eixos Temáticos</h3>
        <p class="kn-quick-desc">Submeta seu trabalho científico no congresso.</p>
    </a>
    
    <a href="{{ '/desafios/' | relative_url }}" class="kn-quick-card">
        <div class="kn-quick-icon">
            <svg fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 15a3 3 0 100-6 3 3 0 000 6zm0 0v5.25m0 0H9m3 0h3M4.5 9h3m9 0h3m-12 0c0-2.071 1.679-3.75 3.75-3.75h3.5c2.071 0 3.75 1.679 3.75 3.75m-11 0v4.5A2.75 2.75 0 0011 16.5h2a2.75 2.75 0 002.75-2.75V9"></path>
            </svg>
        </div>
        <h3 class="kn-quick-title">Competições</h3>
        <p class="kn-quick-desc">Desafio de pontes, robótica, lançamento de foquetes e fotografia.</p>
    </a>
    
    <a href="{{ '/palestras/' | relative_url }}" class="kn-quick-card">
        <div class="kn-quick-icon">
            <svg fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path>
            </svg>
        </div>
        <h3 class="kn-quick-title">Palestras e minicursos</h3>
        <p class="kn-quick-desc">Participe de palestras e minicursos.</p>
    </a>
</div>

<!-- Event News/Features Slideshow (Keynote Style) -->
<div class="my-12">
    <div class="flex flex-col items-center md:items-start mb-8 text-center md:text-left">
        <h2 class="text-2xl sm:text-3xl font-extrabold tracking-tight text-slate-900 dark:text-white">Destaques</h2>
        <div class="w-16 h-1.5 bg-gradient-to-r from-emerald-500 to-teal-500 rounded-full mt-2"></div>
    </div>
    
    <div class="kn-slideshow-container">
        <div class="kn-slideshow-wrapper">
            <button class="kn-slideshow-btn prev" aria-label="Slide anterior">
                <i class="fa-solid fa-chevron-left"></i>
            </button>
            
            <div class="kn-slideshow-track">
                <!-- Slide 1: Submissions -->
                <div class="kn-slideshow-slide">
                    <img src="{{ 'assets/img/carousel_submissions.png' | relative_url }}" alt="Submissões abertas" class="kn-slideshow-img">
                    <div class="kn-slideshow-overlay"></div>
                    <div class="kn-slideshow-caption">
                        <span class="kn-slideshow-tag">Artigos</span>
                        <h3 class="kn-slideshow-title">Submissões Abertas</h3>
                        <p class="kn-slideshow-desc">Envie seu artigo pesquisa para CONTEC.</p>
                        <a href="{{ '/submissao/' | relative_url }}" class="kn-slideshow-link">Enviar meu trabalho <span>&rarr;</span></a>
                    </div>
                </div>

                <!-- Slide 2: Robotics -->
                <div class="kn-slideshow-slide">
                    <img src="{{ 'assets/img/carousel_robot.png' | relative_url }}" alt="Desafio de Robótica" class="kn-slideshow-img">
                    <div class="kn-slideshow-overlay"></div>
                    <div class="kn-slideshow-caption">
                        <span class="kn-slideshow-tag accent">Competições</span>
                        <h3 class="kn-slideshow-title">Desafio de Robótica (DEROB)</h3>
                        <p class="kn-slideshow-desc">Inscreva sua equipe para projetar e testar protótipos autônomos no III Desafio Regional de Robótica.</p>
                        <a href="{{ '/desafios/robotica/' | relative_url }}" class="kn-slideshow-link">Ver Regulamento <span>&rarr;</span></a>
                    </div>
                </div>

                <!-- Slide 3: Bridges -->
                <div class="kn-slideshow-slide">
                    <img src="{{ 'assets/img/carousel_bridges.png' | relative_url }}" alt="Competição de Pontes" class="kn-slideshow-img">
                    <div class="kn-slideshow-overlay"></div>
                    <div class="kn-slideshow-caption">
                        <span class="kn-slideshow-tag accent">Competições</span>
                        <h3 class="kn-slideshow-title">Competição de Pontes</h3>
                        <p class="kn-slideshow-desc">Monte sua equipe e construa a ponte treliçada de palitos mais resistente do congresso.</p>
                        <a href="{{ '/desafios/pontes/' | relative_url }}" class="kn-slideshow-link">Ver Regulamento <span>&rarr;</span></a>
                    </div>
                </div>

                <!-- Slide 4: Schedule -->
                <div class="kn-slideshow-slide">
                    <img src="{{ 'assets/img/carousel_keynotes.png' | relative_url }}" alt="Programação Científica" class="kn-slideshow-img">
                    <div class="kn-slideshow-overlay"></div>
                    <div class="kn-slideshow-caption">
                        <span class="kn-slideshow-tag info">Agenda</span>
                        <h3 class="kn-slideshow-title">Programação Científica</h3>
                        <p class="kn-slideshow-desc">Uma trilha de 7 dias com palestras de pesquisadores renomados, minicursos práticos e muito networking.</p>
                        <a href="{{ '/programacao/' | relative_url }}" class="kn-slideshow-link">Acessar Cronograma <span>&rarr;</span></a>
                    </div>
                </div>
            </div>

            <button class="kn-slideshow-btn next" aria-label="Próximo slide">
                <i class="fa-solid fa-chevron-right"></i>
            </button>
        </div>

        <!-- Indicator Dots -->
        <div class="kn-slideshow-dots">
            <span class="kn-slideshow-dot active" data-index="0"></span>
            <span class="kn-slideshow-dot" data-index="1"></span>
            <span class="kn-slideshow-dot" data-index="2"></span>
            <span class="kn-slideshow-dot" data-index="3"></span>
        </div>
    </div>

</div>

<!-- Important Dates Timeline Section -->
<div class="my-16">
    <div class="flex flex-col items-center mb-10 text-center">
        <h2 class="text-2xl sm:text-3xl font-extrabold tracking-tight text-slate-900 dark:text-white">Datas importantes</h2>
        <div class="w-16 h-1.5 bg-gradient-to-r from-emerald-500 to-teal-500 rounded-full mt-2"></div>
    </div>

    <div class="timeline">
        <div class="timeline-item">
            <div class="timeline-dot"></div>
            <div class="timeline-card">
                <span class="timeline-date">22 de Junho a 03 de Julho de 2026</span>
                <h3 class="timeline-title">Inscrições para Equipes de Pontes</h3>
                <p class="timeline-desc">Período para cadastrar as equipes participantes para o Desafio de Pontes de Palitos de Picolé.</p>
            </div>
        </div>

        <div class="timeline-item">
            <div class="timeline-dot"></div>
            <div class="timeline-card">
                <span class="timeline-date">06 de Julho de 2026</span>
                <h3 class="timeline-title">Lançamento do Edital Científico</h3>
                <p class="timeline-desc">Publicação das diretrizes e regras detalhadas para a submissão de resumos e artigos científicos.</p>
            </div>
        </div>

        <div class="timeline-item active">
            <div class="timeline-dot"></div>
            <div class="timeline-card">
                <span class="timeline-date">28 de Agosto de 2026</span>
                <h3 class="timeline-title">Prazo Final para Submissão</h3>
                <p class="timeline-desc">Data limite para o envio dos trabalhos acadêmicos no sistema SIGEventos.</p>
            </div>
        </div>

        <div class="timeline-item">
            <div class="timeline-dot"></div>
            <div class="timeline-card">
                <span class="timeline-date">21 de Setembro de 2026</span>
                <h3 class="timeline-title">Notificação de Aceite</h3>
                <p class="timeline-desc">Divulgação da lista oficial de resumos e artigos acadêmicos aprovados.</p>
            </div>
        </div>

        <div class="timeline-item">
            <div class="timeline-dot"></div>
            <div class="timeline-card">
                <span class="timeline-date">30 de Setembro de 2026</span>
                <h3 class="timeline-title">Envio da Versão Final</h3>
                <p class="timeline-desc">Prazo final para envio dos trabalhos corrigidos de acordo com as observações da banca.</p>
            </div>
        </div>

        <div class="timeline-item">
            <div class="timeline-dot"></div>
            <div class="timeline-card">
                <span class="timeline-date">17 a 23 de Outubro de 2026</span>
                <h3 class="timeline-title">Realização do Congresso</h3>
                <p class="timeline-desc">Abertura oficial, palestras magnas, minicursos, mesas-redondas, corrida em trilha e desafios.</p>
    </div>

</div>

<!-- Realização e Apoio Section -->
<div class="my-16 text-center">
    <div class="flex flex-col items-center mb-10">
        <h2 class="text-2xl sm:text-3xl font-extrabold tracking-tight text-slate-900 dark:text-white">Realização & Apoio</h2>
        <div class="w-16 h-1.5 bg-gradient-to-r from-emerald-500 to-teal-500 rounded-full mt-2"></div>
    </div>
    
    <div class="kn-about-realizacao-wrapper">
        <div class="kn-about-realizacao-container">
            <div class="kn-about-realizacao-inner">
                <img src="{{ '/assets/img/realizacao.png' | relative_url }}" alt="Realização e Apoio" class="kn-about-realizacao-img" />
                
                <!-- Interactive Map Overlay Links -->
                <a href="https://www.ufma.br" target="_blank" rel="noopener noreferrer" class="realizacao-link link-ufma" title="Universidade Federal do Maranhão - UFMA"></a>
                <a href="https://portalpadrao.ufma.br/balsas" target="_blank" rel="noopener noreferrer" class="realizacao-link link-ccbl" title="CCBL - Centro de Ciências de Balsas"></a>
                <a href="https://portalpadrao.ufma.br/balsas/cursos/bacharelado-interdisciplinar-em-ciencia-e-tecnologia" target="_blank" rel="noopener noreferrer" class="realizacao-link link-bict" title="Bacharelado Interdisciplinar em Ciência e Tecnologia (BICT)"></a>
                <a href="https://sigaa.ufma.br/sigaa/public/curso/portal.jsf?lc=pt_br&id=17230671" target="_blank" rel="noopener noreferrer" class="realizacao-link link-computacao" title="Curso de Engenharia Civil"></a>
                <a href="https://eletrica.ccbl.ufma.br/" target="_blank" rel="noopener noreferrer" class="realizacao-link link-civil" title="Curso de Engenharia Elétrica"></a>
                <a href="https://www.eabalsas.ufma.br" target="_blank" rel="noopener noreferrer" class="realizacao-link link-eletrica" title="Curso de Engenharia Ambiental e Sanitária"></a>
                <a href="https://portalpadrao.ufma.br/site" target="_blank" rel="noopener noreferrer" class="realizacao-link link-fapema" title="UFMA"></a>
            </div>
        </div>
    </div>
</div>

<!-- Countdown Timer & Slideshow Scripts -->
<script>
document.addEventListener('DOMContentLoaded', () => {
    // 1. Countdown Logic (Oct 17, 2026 08:00:00)
    const targetDate = new Date('Oct 17, 2026 08:00:00').getTime();
    const daysEl = document.getElementById('days');
    const hoursEl = document.getElementById('hours');
    const secondsEl = document.getElementById('seconds');

    if (daysEl) {
        const updateTimer = () => {
            const now = new Date().getTime();
            const diff = targetDate - now;

            if (diff < 0) {
                const timerEl = document.querySelector('.countdown-timer');
                if (timerEl) {
                    timerEl.innerHTML = '<div style="font-family: var(--font-heading); font-size: 1.25rem; font-weight:700; color: #10b981;">O evento começou!</div>';
                }
                return;
            }

            const d = Math.floor(diff / (1000 * 60 * 60 * 24));
            const h = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const m = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
            const s = Math.floor((diff % (1000 * 60)) / 1000);

            daysEl.innerText = String(d).padStart(2, '0');
            hoursEl.innerText = String(h).padStart(2, '0');
            secondsEl.innerText = String(s).padStart(2, '0');
        };
        updateTimer();
        setInterval(updateTimer, 1000);
    }

    // 2. Highlights Slideshow Logic
    const slideshowTrack = document.querySelector('.kn-slideshow-track');
    const slideshowPrevBtn = document.querySelector('.kn-slideshow-btn.prev');
    const slideshowNextBtn = document.querySelector('.kn-slideshow-btn.next');
    const slideshowDots = document.querySelectorAll('.kn-slideshow-dot');

    if (slideshowTrack && slideshowPrevBtn && slideshowNextBtn) {
        const getSlideWidth = () => {
            const slide = slideshowTrack.querySelector('.kn-slideshow-slide');
            return slide ? slide.offsetWidth : 300;
        };

        slideshowPrevBtn.addEventListener('click', () => {
            slideshowTrack.scrollBy({ left: -getSlideWidth(), behavior: 'smooth' });
        });

        slideshowNextBtn.addEventListener('click', () => {
            const currentScroll = slideshowTrack.scrollLeft;
            const maxScroll = slideshowTrack.scrollWidth - slideshowTrack.clientWidth;
            
            // Loop back to start if reaching the end
            if (currentScroll >= maxScroll - 5) {
                slideshowTrack.scrollTo({ left: 0, behavior: 'smooth' });
            } else {
                slideshowTrack.scrollBy({ left: getSlideWidth(), behavior: 'smooth' });
            }
        });

        // Update active dot on scroll
        slideshowTrack.addEventListener('scroll', () => {
            const scrollLeft = slideshowTrack.scrollLeft;
            const slideWidth = slideshowTrack.querySelector('.kn-slideshow-slide')?.offsetWidth || 300;
            const activeIndex = Math.round(scrollLeft / slideWidth);

            slideshowDots.forEach((dot, idx) => {
                if (idx === activeIndex) {
                    dot.classList.add('active');
                } else {
                    dot.classList.remove('active');
                }
            });
        });

        // Make dot indicators clickable
        slideshowDots.forEach((dot, idx) => {
            dot.addEventListener('click', () => {
                const slideWidth = slideshowTrack.querySelector('.kn-slideshow-slide')?.offsetWidth || 300;
                slideshowTrack.scrollTo({ left: idx * slideWidth, behavior: 'smooth' });
            });
        });

        // Auto-slide every 6 seconds
        let autoSlideInterval = setInterval(() => {
            slideshowNextBtn.click();
        }, 6000);

        // Reset timer on user interaction
        const resetTimer = () => {
            clearInterval(autoSlideInterval);
            autoSlideInterval = setInterval(() => {
                slideshowNextBtn.click();
            }, 6000);
        };

        slideshowPrevBtn.addEventListener('click', resetTimer);
        slideshowNextBtn.addEventListener('click', resetTimer);
        slideshowDots.forEach(dot => dot.addEventListener('click', resetTimer));
    }
});
</script>
