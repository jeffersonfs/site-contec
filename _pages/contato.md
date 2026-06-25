---
layout: page
title: Contato
permalink: /contato/
nav: true
nav_order: 7
---

<link rel="stylesheet" href="{{ '/assets/css/custom.css' | relative_url }}">

Entre em contato com a Comissão Organizadora do **III CONTEC MATOPIBA** para esclarecer dúvidas sobre inscrições, submissões, parcerias ou outras informações referentes ao evento.

---

<div class="grid-1" style="align-items: start; gap: 2rem; margin-top: 2rem;">

    <!-- Contact Form Card -->
        <!-- Contact Info & Map Card -->
    <div style="display: flex; flex-direction: column; gap: 1.5rem; width: 100%;">

        <div class="card" style="padding: 1.5rem; border: 1px solid var(--global-divider-color); border-radius: 16px; background-color: var(--global-card-bg); box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);">
            <h4 style="font-weight: 800; margin-top: 0; margin-bottom: 1rem; color: var(--global-theme-color);"><i class="fa-solid fa-address-book" style="margin-right: 0.5rem;"></i>Informações de Contato</h4>
            <ul style="list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 0.75rem; font-size: 0.95rem;">
                <li style="display: flex; align-items: center; gap: 0.75rem;">
                    <span style="font-weight: 700; color: var(--global-theme-color);"><i class="fa-solid fa-envelope" style="margin-right: 0.5rem;"></i>E-mail oficial:</span>
                    <a href="mailto:contecmatopiba@ufma.br" style="text-decoration: underline; color: var(--global-text-color);">contecmatopiba@ufma.br</a>
                </li>
  <li style="display: flex; align-items: center; gap: 0.75rem;">
                    <span style="font-weight: 700; color: var(--global-theme-color);"><i class="fa-brands fa-instagram" style="margin-right: 0.5rem;"></i>Instagram:</span>
                    <a href="https://www.instagram.com/contec.matopiba2026/" style="text-decoration: underline; color: var(--global-text-color);">@contec.matopiba2026</a>
                </li>

                <li style="display: flex; align-items: start; gap: 0.75rem; flex-direction: column;">
                    <span style="font-weight: 700; color: var(--global-theme-color);"><i class="fa-solid fa-map-pin" style="margin-right: 0.5rem;"></i>Localização do Evento:</span>
                    <p style="margin: 0; font-size: 0.9rem; color: var(--global-muted-color);">
                        Universidade Federal do Maranhão (UFMA)<br>
                        Centro de Ciências de Balsas (CCBL)<br>
                        MA-140, KM 04, Estrada do Gerais de Balsas<br>
                        Balsas - MA, CEP: 65800-000
                    </p>
                </li>
            </ul>
        </div>

        <!-- OpenStreetMap Card -->
        <div class="card" style="border: 1px solid var(--global-divider-color); border-radius: 16px; overflow: hidden; background-color: var(--global-card-bg); box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);">
            <div style="padding: 1rem 1.5rem; border-bottom: 1px solid var(--global-divider-color); background-color: var(--global-card-bg);">
                <h4 style="font-weight: 800; margin: 0; color: var(--global-theme-color);"><i class="fa-solid fa-map-location-dot" style="margin-right: 0.5rem;"></i>Como Chegar (Campus UFMA Balsas)</h4>
            </div>
            <div style="position: relative; width: 100%; height: 300px; background-color: var(--global-divider-color);">
                <iframe width="100%" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
                    src="https://www.openstreetmap.org/export/embed.html?bbox=-46.098000%2C-7.561000%2C-46.080000%2C-7.549000&amp;layer=mapnik&amp;marker=-7.555244%2C-46.089597"
                    style="border: 0;">
                </iframe>
            </div>
            <div style="padding: 0.75rem 1.5rem; text-align: center; font-size: 0.85rem; border-top: 1px solid var(--global-divider-color);">
                <a href="https://www.openstreetmap.org/?mlat=-7.555244&amp;mlon=-46.089597#map=16/-7.5552/-46.0896" target="_blank" rel="noopener noreferrer" style="color: var(--global-theme-color); font-weight: 700; text-decoration: none;">Ver mapa ampliado &rarr;</a>
            </div>
        </div>

    </div>

</div>

<script>
    // Style interactive inputs on focus
    document.addEventListener('DOMContentLoaded', () => {
        const inputs = document.querySelectorAll('#contact-form input, #contact-form textarea, #contact-form select');
        
        inputs.forEach(el => {
            el.addEventListener('focus', () => {
                el.style.borderColor = 'var(--global-theme-color)';
                el.style.boxShadow = '0 0 0 3px rgba(15, 118, 110, 0.15)';
            });
            el.addEventListener('blur', () => {
                el.style.borderColor = 'var(--global-divider-color)';
                el.style.boxShadow = 'none';
            });
        });
    });
</script>
