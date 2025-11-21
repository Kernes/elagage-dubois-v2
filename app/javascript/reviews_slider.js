(function() {
  let slider, prevBtn, nextBtn, dotsContainer;
  let reviews, totalReviews;
  let currentIndex = 0;
  let resizeTimeout;
  let touchStartX = 0;
  let touchEndX = 0;
  
  // Fonctions nommées pour pouvoir retirer les event listeners
  let handleNextClick, handlePrevClick, handleResize, handleTouchStart, handleTouchEnd;
  
  // Déterminer le nombre d'avis visibles selon la taille d'écran
  function getVisibleCount() {
    if (window.innerWidth < 640) return 1; // Mobile: 1 avis
    if (window.innerWidth < 1024) return 2; // Tablet: 2 avis
    return 3; // Desktop: 3 avis
  }
  
  // Calculer le nombre de slides (positions possibles)
  function getTotalSlides() {
    if (!reviews || reviews.length === 0) return 0;
    const visible = getVisibleCount();
    // Nombre de slides = nombre total d'avis - nombre d'avis visibles + 1
    // Exemple: 6 avis, 3 visibles = 6 - 3 + 1 = 4 slides
    // Limité au nombre d'avis maximum
    return Math.min(reviews.length, Math.max(1, totalReviews - visible + 1));
  }
  
  // Créer les points indicateurs (un point par slide possible)
  function createDots() {
    if (!dotsContainer) return;
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
    if (!slider || !reviews || reviews.length === 0) return;
    
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
    const dots = dotsContainer ? dotsContainer.querySelectorAll('button') : [];
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
  
  // Fonction d'initialisation
  function initReviewsSlider() {
    // Récupérer les éléments DOM à chaque initialisation
    slider = document.getElementById('reviews-slider');
    prevBtn = document.getElementById('reviews-prev');
    nextBtn = document.getElementById('reviews-next');
    dotsContainer = document.getElementById('reviews-dots');
    
    // Si les éléments n'existent pas, ne pas initialiser
    if (!slider || !prevBtn || !nextBtn || !dotsContainer) {
      return;
    }
    
    // Récupérer les avis
    reviews = slider.querySelectorAll('.flex-shrink-0.group');
    totalReviews = reviews.length;
    
    if (totalReviews === 0) {
      return;
    }
    
    // Réinitialiser l'index
    currentIndex = 0;
    
    // Retirer les anciens event listeners s'ils existent
    if (handleNextClick && nextBtn) {
      nextBtn.removeEventListener('click', handleNextClick);
    }
    if (handlePrevClick && prevBtn) {
      prevBtn.removeEventListener('click', handlePrevClick);
    }
    if (handleResize) {
      window.removeEventListener('resize', handleResize);
    }
    if (handleTouchStart && slider) {
      slider.removeEventListener('touchstart', handleTouchStart);
    }
    if (handleTouchEnd && slider) {
      slider.removeEventListener('touchend', handleTouchEnd);
    }
    
    // Créer les nouvelles fonctions de gestionnaire
    handleNextClick = nextSlide;
    handlePrevClick = prevSlide;
    handleResize = function() {
      clearTimeout(resizeTimeout);
      resizeTimeout = setTimeout(() => {
        currentIndex = 0;
        createDots();
        updateSlider();
      }, 250);
    };
    handleTouchStart = function(e) {
      touchStartX = e.changedTouches[0].screenX;
    };
    handleTouchEnd = function(e) {
      touchEndX = e.changedTouches[0].screenX;
      handleSwipe();
    };
    
    // Ajouter les nouveaux event listeners
    nextBtn.addEventListener('click', handleNextClick);
    prevBtn.addEventListener('click', handlePrevClick);
    window.addEventListener('resize', handleResize);
    slider.addEventListener('touchstart', handleTouchStart);
    slider.addEventListener('touchend', handleTouchEnd);
    
    // Initialisation
    createDots();
    updateSlider();
    initReviewToggles();
  }
  
  // Fonction pour initialiser les toggles "voir plus/voir moins"
  function initReviewToggles() {
    const reviewTexts = document.querySelectorAll('.review-text');
    const toggleButtons = document.querySelectorAll('.review-toggle');
    
    reviewTexts.forEach((textEl, index) => {
      const toggleBtn = toggleButtons[index];
      if (!toggleBtn) return;
      
      // Vérifier si le texte dépasse 7 lignes
      const needsToggle = textEl.scrollHeight > textEl.clientHeight;
      
      // Si le texte ne dépasse pas 7 lignes, cacher le bouton
      if (!needsToggle) {
        toggleBtn.style.display = 'none';
        return;
      }
      
      // Afficher le bouton
      toggleBtn.style.display = 'block';
      
      // Retirer les anciens event listeners en clonant le bouton
      const newToggleBtn = toggleBtn.cloneNode(true);
      toggleBtn.parentNode.replaceChild(newToggleBtn, toggleBtn);
      
      // Ajouter le nouvel event listener
      newToggleBtn.addEventListener('click', function() {
        const isExpanded = textEl.classList.contains('expanded');
        
        if (isExpanded) {
          textEl.classList.remove('expanded');
          newToggleBtn.textContent = 'Voir plus';
          newToggleBtn.setAttribute('aria-label', 'Voir plus');
        } else {
          textEl.classList.add('expanded');
          newToggleBtn.textContent = 'Voir moins';
          newToggleBtn.setAttribute('aria-label', 'Voir moins');
        }
      });
    });
  }
  
  // Initialiser au chargement de la page
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initReviewsSlider);
  } else {
    initReviewsSlider();
  }
  
  // Réinitialiser lors de la navigation Turbo
  document.addEventListener('turbo:load', initReviewsSlider);
  document.addEventListener('turbo:frame-load', initReviewsSlider);
})();
