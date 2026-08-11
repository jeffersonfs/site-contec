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

{% include contec-hero.html %}
{% include contec-countdown.html %}

<!-- Welcome Introduction Text -->
<div class="max-w-4xl mx-auto text-slate-700 dark:text-slate-300 text-center sm:text-left mb-12">
    <p class="text-base sm:text-lg leading-relaxed mb-4">
        Seja muito bem-vindo ao portal oficial do <strong>III Congresso de Tecnologia, Engenharia e Ciência (CONTEC MATOPIBA)</strong>! O evento é uma iniciativa do Centro de Ciências de Balsas da Universidade Federal do Maranhão (UFMA) com o propósito de integrar ensino, pesquisa, extensão e inovação sob a perspectiva do desenvolvimento regional.
    </p>
    <p class="text-base sm:text-lg leading-relaxed">
        Realizado no Centro de Ciências da Balsas (MA).</p>
</div>

{% include contec-quick-nav.html %}
{% include contec-highlights.html %}
{% include contec-timeline.html %}
{% include contec-realizacao.html %}
{% include contec-scripts.html %}
