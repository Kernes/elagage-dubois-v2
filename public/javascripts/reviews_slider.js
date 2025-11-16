(function() {
  const slider = document.getElementById('reviews-slider');
  const prevBtn = document.getElementById('reviews-prev');
  const nextBtn = document.getElementById('reviews-next');
  const dotsContainer = document.getElementById('reviews-dots');
  
  if (!slider || !prevBtn || !nextBtn || !dotsContainer) return;
  
  const reviews = slider.querySelectorAll('.flex-shrink-0.group');
  const totalReviews = reviews.length;
  let currentIndex = 0;
  
  // Déterminer le nombre d'avis visibles selon la taille d'écran
  function getVisibleCount() {
    if (window.innerWidth < 640) return 1; // Mobile: 1 avis
    if (window.innerWidth < 1024) return 2; // Tablet: 2 avis
    return 3; // Desktop: 3 avis
  }
  
  // Calculer le nombre de slides (positions possibles)
  function getTotalSlides() {
    const visible = getVisibleCount();
    // Nombre de slides = nombre total d'avis - nombre d'avis visibles + 1
    // Exemple: 6 avis, 3 visibles = 6 - 3 + 1 = 4 slides
    // Limité au nombre d'avis maximum
    return Math.min(reviews.length, Math.max(1, totalReviews - visible + 1));
  }
  
  // Créer les points indicateurs (un point par slide possible)
  function createDots() {
    dotsContainer.innerHTML = '';
    const totalSlides = getTotalSlides();
    for (let i = 0; i < totalSlides; i++) {
      const dot = document.createElement('button');
      dot.className = `w-2 h-2 rounded-full transition-colors ${i === 0 ? 'bg-green-700' : 'bg-gray-300'}`;
      dot.setAttribute('aria-label', `Aller à l'avis ${i + 1}`);
      dot.addEventListener('click', () => goToSlide(i));
      dotsContainer.appendChild(dot);
    }
  }
  
  // Mettre à jour la position du slider
  function updateSlider() {
    const visible = getVisibleCount();
    const totalSlides = getTotalSlides();
    
    // S'assurer que currentIndex ne dépasse pas le nombre de slides
    if (currentIndex >= totalSlides) {
      currentIndex = totalSlides - 1;
    }
    if (currentIndex < 0) {
      currentIndex = 0;
    }
    
    // Calculer le translateX : chaque slide déplace d'un avis
    // Si on a 6 avis et 3 visibles, chaque slide déplace de 1/3 de la largeur
    const slideWidth = 100 / visible;
    const translateX = -currentIndex * slideWidth;
    
    // Limiter le translateX pour ne pas dépasser la fin
    const maxTranslateX = -((totalReviews - visible) * slideWidth);
    const finalTranslateX = Math.max(translateX, maxTranslateX);
    
    slider.style.transform = `translateX(${finalTranslateX}%)`;
    
    // Mettre à jour les points
    const dots = dotsContainer.querySelectorAll('button');
    dots.forEach((dot, index) => {
      if (index === currentIndex) {
        dot.classList.remove('bg-gray-300');
        dot.classList.add('bg-green-700');
      } else {
        dot.classList.remove('bg-green-700');
        dot.classList.add('bg-gray-300');
      }
    });
  }
  
  // Aller à un slide spécifique
  function goToSlide(index) {
    const totalSlides = getTotalSlides();
    currentIndex = Math.max(0, Math.min(index, totalSlides - 1));
    updateSlider();
  }
  
  // Slide suivant
  function nextSlide() {
    const totalSlides = getTotalSlides();
    if (currentIndex < totalSlides - 1) {
      currentIndex++;
    } else {
      currentIndex = 0; // Retour au début si on est à la fin
    }
    updateSlider();
  }
  
  // Slide précédent
  function prevSlide() {
    const totalSlides = getTotalSlides();
    if (currentIndex > 0) {
      currentIndex--;
    } else {
      currentIndex = totalSlides - 1; // Aller à la fin si on est au début
    }
    updateSlider();
  }
  
  // Gestionnaires d'événements
  nextBtn.addEventListener('click', nextSlide);
  prevBtn.addEventListener('click', prevSlide);
  
  // Réinitialiser lors du redimensionnement
  let resizeTimeout;
  window.addEventListener('resize', () => {
    clearTimeout(resizeTimeout);
    resizeTimeout = setTimeout(() => {
      currentIndex = 0;
      createDots();
      updateSlider();
    }, 250);
  });
  
  // Support du swipe sur mobile
  let touchStartX = 0;
  let touchEndX = 0;
  
  slider.addEventListener('touchstart', (e) => {
    touchStartX = e.changedTouches[0].screenX;
  });
  
  slider.addEventListener('touchend', (e) => {
    touchEndX = e.changedTouches[0].screenX;
    handleSwipe();
  });
  
  function handleSwipe() {
    const swipeThreshold = 50;
    const diff = touchStartX - touchEndX;
    
    if (Math.abs(diff) > swipeThreshold) {
      if (diff > 0) {
        nextSlide();
      } else {
        prevSlide();
      }
    }
  }
  
  // Initialisation
  createDots();
  updateSlider();
  
  // Réinitialiser lors de la navigation Turbo
  document.addEventListener('turbo:load', () => {
    currentIndex = 0;
    createDots();
    updateSlider();
  });
})();

