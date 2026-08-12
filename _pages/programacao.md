---
layout: page
title: Programação
permalink: /programacao/
nav: true
nav_order: 5
---

<link rel="stylesheet" href="{{ '/assets/css/custom.css' | relative_url }}">

<style>
    .schedule-day {
        display: none;
    }

    .schedule-day.active {
        display: block;
        animation: fadeIn 0.35s cubic-bezier(0.16, 1, 0.3, 1);
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(8px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>

<!-- Section Banner -->
<div class="kn-page-banner">
    <img src="{{ 'assets/img/banners/bannersite5.png' | relative_url }}" alt="Programação Científica - III CONTEC MATOPIBA" class="kn-page-banner-img">
</div>

<div class="max-w-4xl mx-auto text-center sm:text-left my-6">
    <p class="text-base sm:text-lg text-slate-700 dark:text-slate-300 leading-relaxed">
        Cronograma completo de atividades do <strong>III CONTEC MATOPIBA</strong> (17 a 23 de Outubro de 2026). Navegue pelos dias utilizando as abas deslizantes abaixo:
    </p>
</div>

<!-- Day Selector Tabs (Swipeable on mobile) -->
<div class="kn-schedule-tabs-container">
    <button class="kn-tab-btn" data-day="day1">Sáb, 17/10</button>
    <button class="kn-tab-btn" data-day="day2">Dom, 18/10</button>
    <button class="kn-tab-btn active" data-day="day3">Seg, 19/10</button>
    <button class="kn-tab-btn" data-day="day4">Ter, 20/10</button>
    <button class="kn-tab-btn" data-day="day5">Qua, 21/10</button>
    <button class="kn-tab-btn" data-day="day6">Qui, 22/10</button>
    <button class="kn-tab-btn" data-day="day7">Sex, 23/10</button>
</div>

<!-- DAY 1: Saturday -->
<div class="schedule-day" id="day1">
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th>Hora</th>
                    <th>Atividade</th>
                    <th>Local</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td data-label="Hora"><strong>08:00 - 12:00</strong></td>
                    <td data-label="Atividade"><strong style="color: var(--global-theme-color);">Visita Técnica</strong> a polos estratégicos agrícolas da região de Balsas</td>
                    <td data-label="Local">Polos de Produção Local</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<!-- DAY 2: Sunday -->
<div class="schedule-day" id="day2">
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th>Hora</th>
                    <th>Atividade</th>
                    <th>Local</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td data-label="Hora"><strong>06:30</strong></td>
                    <td data-label="Atividade"><strong style="color: #cca025;">IV Corrida em Trilha</strong> do Centro de Ciências de Balsas (Integrando Universidade & Sociedade)</td>
                    <td data-label="Local">Trilhas de Balsas / Campus CCBL</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<!-- DAY 3: Monday (Active by default) -->
<div class="schedule-day active" id="day3">
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th>Hora</th>
                    <th>Atividade</th>
                    <th>Local</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td data-label="Hora"><strong>14:00 - 18:00</strong></td>
                    <td data-label="Atividade"><strong style="color: var(--global-theme-color);">Oficina de Foguetes</strong> (Atividade Prática)</td>
                    <td data-label="Local">Área Externa / CCBL</td>
                </tr>
                <tr>
                    <td data-label="Hora"><strong>14:30 - 21:00</strong></td>
                    <td data-label="Atividade">Credenciamento e entrega de materiais aos participantes</td>
                    <td data-label="Local">Entrada do Auditório</td>
                </tr>
                <tr>
                    <td data-label="Hora"><strong>18:30 - 20:00</strong></td>
                    <td data-label="Atividade"><strong style="color: var(--global-text-color);">Cerimônia de Abertura Oficial</strong> do III CONTEC</td>
                    <td data-label="Local">Auditório</td>
                </tr>
                <tr>
                    <td data-label="Hora"><strong>20:00 - 21:00</strong></td>
                    <td data-label="Atividade"><strong style="color: var(--global-theme-color);">Palestra Magna:</strong></td>
                    <td data-label="Local">Auditório</td>
                </tr>
                <tr>
                    <td data-label="Hora"><strong>21:00</strong></td>
                    <td data-label="Atividade">Coffee break e Momento de Integração Cultural</td>
                    <td data-label="Local">Área de Convivência</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<!-- DAY 4: Tuesday -->
<div class="schedule-day" id="day4">
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th>Hora</th>
                    <th>Atividade</th>
                    <th>Local</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td data-label="Hora"><strong>14:00 - 18:00</strong></td>
                    <td data-label="Atividade">Realização de Minicursos Técnicos e Oficinas Científicas</td>
                    <td data-label="Local">Salas do Bloco Pedagógico / Lab Informática</td>
                </tr>
                <tr>
                    <td data-label="Hora"><strong>18:30 - 20:00</strong></td>
                    <td data-label="Atividade"><strong style="color: var(--global-theme-color);">Palestra 1:</strong> "Inovação Tecnológica e suas vertentes nas Engenharias"</td>
                    <td data-label="Local">Auditório</td>
                </tr>
                <tr>
                    <td data-label="Hora"><strong>20:00 - 20:30</strong></td>
                    <td data-label="Atividade">Apresentações Artísticas: Momento "Grolado Cultural"</td>
                    <td data-label="Local">Área de Convivência</td>
                </tr>
                <tr>
                    <td data-label="Hora"><strong>20:30 - 22:00</strong></td>
                    <td data-label="Atividade"><strong style="color: #cca025;">Desafio da Robótica</strong> (Exposição e competição tecnológica)</td>
                    <td data-label="Local">Bloco de Laboratório</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<!-- DAY 5: Wednesday -->
<div class="schedule-day" id="day5">
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th>Hora</th>
                    <th>Atividade</th>
                    <th>Local</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td data-label="Hora"><strong>14:00 - 18:00</strong></td>
                    <td data-label="Atividade"><strong style="color: var(--global-text-color);">Sessões Científicas:</strong> Apresentação Oral de Artigos & Painéis de Pôsteres</td>
                    <td data-label="Local">Salas Temáticas Bloco A / Corredor Central</td>
                </tr>
                <tr>
                    <td data-label="Hora"><strong>18:30 - 20:00</strong></td>
                    <td data-label="Atividade"><strong style="color: var(--global-theme-color);">Palestra 2:</strong> "Perspectivas Interdisciplinares na Educação e Sustentabilidade"</td>
                    <td data-label="Local">Auditório</td>
                </tr>
                <tr>
                    <td data-label="Hora"><strong>20:00 - 20:30</strong></td>
                    <td data-label="Atividade">Apresentações Artísticas: Momento "Grolado Cultural"</td>
                    <td data-label="Local">Área de Convivência</td>
                </tr>
                <tr>
                    <td data-label="Hora"><strong>20:30 - 22:00</strong></td>
                    <td data-label="Atividade"><strong style="color: #cca025;">Desafio das Pontes:</strong> Rompimento Estrutural das Pontes de Palito de Picolé</td>
                    <td data-label="Local">Auditório</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<!-- DAY 6: Thursday -->
<div class="schedule-day" id="day6">
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th>Hora</th>
                    <th>Atividade</th>
                    <th>Local</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td data-label="Hora"><strong>14:00 - 16:00</strong></td>
                    <td data-label="Atividade">Continuação e Conclusão de Minicursos/Oficinas</td>
                    <td data-label="Local">Salas Temáticas</td>
                </tr>
                <tr>
                    <td data-label="Hora"><strong>16:00 - 17:30</strong></td>
                    <td data-label="Atividade"><strong style="color: var(--global-theme-color);">Atividade Prática:</strong> Lançamento ao Ar Livre de Foguetes de Garrafa PET</td>
                    <td data-label="Local">Área Aberta</td>
                </tr>
                <tr>
                    <td data-label="Hora"><strong>18:30 - 20:00</strong></td>
                    <td data-label="Atividade"><strong style="color: var(--global-text-color);">Mesa Redonda:</strong> "O Egresso do CCBL no Mercado de Trabalho e Desenvolvimento Regional"</td>
                    <td data-label="Local">Auditório</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<!-- DAY 7: Friday -->
<div class="schedule-day" id="day7">
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th>Hora</th>
                    <th>Atividade</th>
                    <th>Local</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td data-label="Hora"><strong>18:30 - 19:45</strong></td>
                    <td data-label="Atividade"><strong style="color: var(--global-theme-color);">Palestra Magna</strong> de Encerramento do III CONTEC</td>
                    <td data-label="Local">Auditório</td>
                </tr>
                <tr>
                    <td data-label="Hora"><strong>19:45 - 22:00</strong></td>
                    <td data-label="Atividade"><strong style="color: #cca025;">Solenidade de Premiação:</strong> Concurso de Fotografia das competiçoes + Encerramento Geral</td>
                    <td data-label="Local">Auditório</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<hr class="border-slate-100 dark:border-slate-800 my-8">

<!-- Atividade Transversal -->
<div style="margin: 2rem auto; max-width: 800px; background-color: var(--global-card-bg); padding: 1.5rem; border-radius: 16px; border: 1px solid var(--global-divider-color);">
    <h3 style="font-size: 1.15rem; font-weight: 800; color: var(--global-text-color); margin: 0 0 0.5rem 0;"><i class="fa-solid fa-camera" style="color: var(--global-theme-color); margin-right: 0.5rem;"></i>Atividade Transversal: Concurso de Fotografia Criativa e Arte Digital</h3>
    <p style="font-size: 0.85rem; color: var(--global-muted-color); line-height: 1.5; margin: 0 0 1rem 0;">
        Com o tema <strong>"Saberes conectados: para a resolução de problemas complexos"</strong> (Edital nº 04/2026), o IV Concurso de Fotografia Criativa e Arte Digital ocorrerá nas modalidades de Fotografia Digital e Vídeo Curto. As obras selecionadas serão publicadas no Instagram oficial e expostas durante o evento para votação do público e avaliação da banca técnica.
    </p>
</div>

<script>
    // Simple day tab switcher
    document.addEventListener('DOMContentLoaded', () => {
        const tabButtons = document.querySelectorAll('.kn-tab-btn');
        const scheduleDays = document.querySelectorAll('.schedule-day');

        tabButtons.forEach(btn => {
            btn.addEventListener('click', () => {
                const selectedDay = btn.getAttribute('data-day');

                // Set active tab button
                tabButtons.forEach(b => b.classList.remove('active'));
                btn.classList.add('active');

                // Show selected day's table
                scheduleDays.forEach(day => {
                    day.classList.remove('active');
                    if (day.id === selectedDay) {
                        day.classList.add('active');
                    }
                });
            });
        });
    });
</script>
