(function() {
  const modal = document.getElementById('image-modal');
  const modalImage = document.getElementById('modal-image');
  const modalCategory = document.getElementById('modal-category');
  const modalCounter = document.getElementById('modal-counter');
  const modalClose = document.getElementById('modal-close');
  const modalPrev = document.getElementById('modal-prev');
  const modalNext = document.getElementById('modal-next');
  const galleryItems = document.querySelectorAll('.gallery-item');
  
  if (!modal || !modalImage || !galleryItems.length) return;
  
  let currentCategory = '';
  let currentImages = [];
  let currentIndex = 0;
  
  // Récupérer toutes les images d'une catégorie
  function getCategoryImages(category) {
    const items = Array.from(document.querySelectorAll(`.gallery-item[data-category="${category}"]`));
    return items.map(item => {
      const img = item.querySelector('img');
      return {
        src: img.src,
        alt: img.alt,
        category: category
      };
    });
  }
  
  // Ouvrir la modal avec une image spécifique
  function openModal(category, imageIndex) {
    currentCategory = category;
    currentImages = getCategoryImages(category);
    currentIndex = parseInt(imageIndex) || 0;
    
    if (currentImages.length === 0) return;
    
    // S'assurer que l'index est valide
    if (currentIndex < 0) currentIndex = 0;
    if (currentIndex >= currentImages.length) currentIndex = currentImages.length - 1;
    
    updateModalImage();
    modal.classList.remove('hidden');
    document.body.style.overflow = 'hidden'; // Empêcher le scroll du body
    
    // Afficher/masquer les boutons de navigation
    if (currentImages.length > 1) {
      modalPrev.classList.remove('hidden');
      modalNext.classList.remove('hidden');
    } else {
      modalPrev.classList.add('hidden');
      modalNext.classList.add('hidden');
    }
  }
  
  // Fermer la modal
  function closeModal() {
    modal.classList.add('hidden');
    document.body.style.overflow = ''; // Restaurer le scroll du body
  }
  
  // Mettre à jour l'image affichée dans la modal
  function updateModalImage() {
    if (currentImages.length === 0) return;
    
    const image = currentImages[currentIndex];
    modalImage.src = image.src;
    modalImage.alt = image.alt;
    modalCategory.textContent = image.category;
    modalCounter.textContent = `${currentIndex + 1} / ${currentImages.length}`;
    
    // Centrer le titre après le chargement de l'image
    modalImage.onload = function() {
      setTimeout(centerTitleWithImage, 50);
    };
    if (modalImage.complete) {
      setTimeout(centerTitleWithImage, 50);
    }
  }
  
  // Image suivante
  function nextImage() {
    if (currentImages.length === 0) return;
    currentIndex = (currentIndex + 1) % currentImages.length;
    updateModalImage();
  }
  
  // Image précédente
  function prevImage() {
    if (currentImages.length === 0) return;
    currentIndex = (currentIndex - 1 + currentImages.length) % currentImages.length;
    updateModalImage();
  }
  
  // Ajouter les événements de clic sur les images de la galerie
  galleryItems.forEach(item => {
    item.addEventListener('click', function() {
      const category = this.getAttribute('data-category');
      const imageIndex = this.getAttribute('data-image-index');
      openModal(category, imageIndex);
    });
  });
  
  // Événements de la modal
  modalClose.addEventListener('click', closeModal);
  modalPrev.addEventListener('click', prevImage);
  modalNext.addEventListener('click', nextImage);
  
  // Fermer la modal en cliquant sur le fond (mais pas sur l'image ou les boutons)
  const modalBackdrop = document.getElementById('modal-backdrop');
  const imageContainer = document.getElementById('image-container');
  const imageWrapper = document.getElementById('image-wrapper');
  const imageInnerWrapper = document.getElementById('image-inner-wrapper');
  
  // Fonction pour vérifier si le clic est sur l'image ou ses éléments
  function isClickOnImage(target) {
    // Vérifier si on clique directement sur l'image
    if (target === modalImage) {
      return true;
    }
    // Vérifier si on clique sur un bouton (croix, flèches)
    if (target.closest('button')) {
      return true;
    }
    // Vérifier si on clique sur le wrapper interne (qui contient l'image réelle)
    if (target === imageInnerWrapper || target.closest('#image-inner-wrapper')) {
      return true;
    }
    // Vérifier si on clique sur le titre
    if (target.closest('#modal-title-container')) {
      return true;
    }
    return false;
  }
  
  // Fonction pour vérifier si le clic est en dehors de l'image (coordonnées)
  function isClickOutsideImageByCoordinates(x, y) {
    if (!imageInnerWrapper || !modalImage) return true;
    
    const imageRect = imageInnerWrapper.getBoundingClientRect();
    // Vérifier si le clic est dans les limites du wrapper interne (image réelle)
    return !(x >= imageRect.left && x <= imageRect.right && 
             y >= imageRect.top && y <= imageRect.bottom);
  }
  
  // Fermer en cliquant sur le fond de la modal
  modal.addEventListener('click', function(e) {
    // Si on clique directement sur la modal (fond noir), fermer
    if (e.target === modal) {
      closeModal();
      return;
    }
    // Sinon vérifier si on clique en dehors de l'image
    if (!isClickOnImage(e.target)) {
      const clickX = e.clientX || e.pageX;
      const clickY = e.clientY || e.pageY;
      if (isClickOutsideImageByCoordinates(clickX, clickY)) {
        closeModal();
      }
    }
  });
  
  // Fermer en cliquant sur le backdrop (zone autour de l'image)
  if (modalBackdrop) {
    modalBackdrop.addEventListener('click', function(e) {
      // Si on clique directement sur le backdrop, fermer
      if (e.target === modalBackdrop) {
        closeModal();
        return;
      }
      // Sinon vérifier si on clique en dehors de l'image
      if (!isClickOnImage(e.target)) {
        const clickX = e.clientX || e.pageX;
        const clickY = e.clientY || e.pageY;
        if (isClickOutsideImageByCoordinates(clickX, clickY)) {
          closeModal();
        }
      }
    });
  }
  
  // Améliorer la fermeture sur mobile : permettre le tap en dehors
  let touchStartTime = 0;
  let touchStartTarget = null;
  let touchStartXClose = 0;
  let touchStartYClose = 0;
  
  // Fonction pour gérer le touch sur mobile
  function handleTouchStart(e) {
    if (modal.classList.contains('hidden')) return;
    
    const touch = e.touches[0];
    const target = e.target;
    touchStartTarget = target;
    touchStartXClose = touch.clientX;
    touchStartYClose = touch.clientY;
    
    // Vérifier si on touche en dehors de l'image (par coordonnées)
    if (isClickOutsideImageByCoordinates(touchStartXClose, touchStartYClose) && !isClickOnImage(target)) {
      touchStartTime = new Date().getTime();
    } else {
      touchStartTime = 0;
    }
  }
  
  function handleTouchEnd(e) {
    if (modal.classList.contains('hidden')) return;
    if (!touchStartTarget || touchStartTime === 0) {
      touchStartTarget = null;
      return;
    }
    
    const touch = e.changedTouches[0];
    const touchEndX = touch.clientX;
    const touchEndY = touch.clientY;
    
    // Calculer la distance du mouvement
    const deltaX = Math.abs(touchEndX - touchStartXClose);
    const deltaY = Math.abs(touchEndY - touchStartYClose);
    const distance = Math.sqrt(deltaX * deltaX + deltaY * deltaY);
    
    // Si on a tapé en dehors de l'image et que le mouvement est petit (pas un swipe)
    if (isClickOutsideImageByCoordinates(touchStartXClose, touchStartYClose) && 
        !isClickOnImage(touchStartTarget) && 
        distance < 20) {
      const touchDuration = new Date().getTime() - touchStartTime;
      // Fermer si le touch est court (tap) - moins de 500ms
      if (touchDuration < 500 && touchDuration > 0) {
        e.preventDefault();
        e.stopPropagation();
        closeModal();
        return;
      }
    }
    
    touchStartTarget = null;
    touchStartTime = 0;
  }
  
  // Ajouter les événements sur le backdrop
  if (modalBackdrop) {
    modalBackdrop.addEventListener('touchstart', handleTouchStart, { passive: true });
    modalBackdrop.addEventListener('touchend', handleTouchEnd, { passive: false });
  }
  
  // Ajouter les événements sur la modal elle-même
  modal.addEventListener('touchstart', handleTouchStart, { passive: true });
  modal.addEventListener('touchend', handleTouchEnd, { passive: false });
  
  // Centrer le titre avec l'image réelle
  function centerTitleWithImage() {
    const titleContainer = document.getElementById('modal-title-container');
    const imageInnerWrapper = document.getElementById('image-inner-wrapper');
    
    if (titleContainer && imageInnerWrapper && modalImage) {
      // Obtenir la position réelle de l'image (via le wrapper interne)
      const imageRect = imageInnerWrapper.getBoundingClientRect();
      const modalRect = modal.getBoundingClientRect();
      
      // Calculer le centre de l'image par rapport à la modal
      const imageCenterX = imageRect.left + imageRect.width / 2 - modalRect.left;
      
      // Positionner le titre au centre de l'image
      const leftPercent = (imageCenterX / modalRect.width) * 100;
      titleContainer.style.left = `${leftPercent}%`;
      titleContainer.style.transform = 'translateX(-50%)';
    }
  }
  
  // Ajuster le titre lors du redimensionnement
  window.addEventListener('resize', function() {
    if (!modal.classList.contains('hidden')) {
      setTimeout(centerTitleWithImage, 50);
    }
  });
  
  // Navigation au clavier
  document.addEventListener('keydown', function(e) {
    if (modal.classList.contains('hidden')) return;
    
    switch(e.key) {
      case 'Escape':
        closeModal();
        break;
      case 'ArrowLeft':
        prevImage();
        break;
      case 'ArrowRight':
        nextImage();
        break;
    }
  });
  
  // Support du swipe sur mobile
  let touchStartX = 0;
  let touchEndX = 0;
  let touchStartY = 0;
  let touchEndY = 0;
  let isSwiping = false;
  
  // Gérer le swipe sur toute la modal pour mobile
  modal.addEventListener('touchstart', function(e) {
    if (modal.classList.contains('hidden')) return;
    touchStartX = e.changedTouches[0].screenX;
    touchStartY = e.changedTouches[0].screenY;
    isSwiping = true;
  }, { passive: true });
  
  modal.addEventListener('touchmove', function(e) {
    if (!isSwiping) return;
    // Permettre le scroll vertical si nécessaire
    const currentY = e.changedTouches[0].screenY;
    const diffY = Math.abs(currentY - touchStartY);
    const diffX = Math.abs(e.changedTouches[0].screenX - touchStartX);
    
    // Si le mouvement vertical est plus important, c'est un scroll, pas un swipe
    if (diffY > diffX) {
      isSwiping = false;
    }
  }, { passive: true });
  
  modal.addEventListener('touchend', function(e) {
    if (!isSwiping) return;
    touchEndX = e.changedTouches[0].screenX;
    touchEndY = e.changedTouches[0].screenY;
    handleSwipe();
    isSwiping = false;
  }, { passive: true });
  
  function handleSwipe() {
    const swipeThreshold = 50;
    const diffX = touchStartX - touchEndX;
    const diffY = Math.abs(touchStartY - touchEndY);
    
    // Ignorer si le mouvement vertical est plus important (scroll)
    if (diffY > Math.abs(diffX)) return;
    
    if (Math.abs(diffX) > swipeThreshold) {
      if (diffX > 0) {
        nextImage();
      } else {
        prevImage();
      }
    }
  }
  
  // Améliorer la fermeture sur mobile : double tap sur l'image pour fermer
  let lastTap = 0;
  let lastTapTime = 0;
  modalImage.addEventListener('touchend', function(e) {
    e.stopPropagation(); // Empêcher la propagation au backdrop
    const currentTime = new Date().getTime();
    const tapLength = currentTime - lastTapTime;
    
    // Double tap pour fermer sur mobile (dans les 300ms)
    if (tapLength < 300 && tapLength > 0) {
      e.preventDefault();
      closeModal();
      lastTapTime = 0;
    } else {
      lastTapTime = currentTime;
    }
  }, { passive: false });
  
  // Réinitialiser lors de la navigation Turbo
  document.addEventListener('turbo:load', function() {
    closeModal();
  });
})();

