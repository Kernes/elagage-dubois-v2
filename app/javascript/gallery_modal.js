(function() {
  let currentCategory = '';
  let currentImages = [];
  let currentIndex = 0;
  
  // Variables pour stocker les références aux éléments
  let modal, modalImage, modalCategory, modalCounter, modalClose, modalPrev, modalNext;
  let modalBackdrop, imageInnerWrapper;
  
  // Récupérer toutes les images d'une catégorie
  function getCategoryImages(category) {
    const items = Array.from(document.querySelectorAll(`.gallery-item[data-category="${category}"]`));
    return items.map(item => {
      const img = item.querySelector('img');
      // Utiliser data-full-url si disponible (haute résolution pour la modal), sinon utiliser src
      const fullUrl = img.getAttribute('data-full-url') || img.src;
      // Pour les images Unsplash, s'assurer d'avoir une version haute résolution
      let highResUrl = fullUrl;
      if (fullUrl.includes('unsplash.com') && !fullUrl.includes('w=1920')) {
        // Remplacer ou ajouter le paramètre w=1920 pour une haute résolution
        if (fullUrl.includes('w=')) {
          highResUrl = fullUrl.replace(/w=\d+/, 'w=1920');
        } else {
          highResUrl = fullUrl + (fullUrl.includes('?') ? '&' : '?') + 'w=1920';
        }
      }
      return {
        src: highResUrl,
        alt: img.alt,
        category: category
      };
    });
  }
  
  // Ouvrir la modal avec une image spécifique
  function openModal(category, imageIndex) {
    if (!modal || !modalImage) return;
    
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
    if (!modal) return;
    modal.classList.add('hidden');
    document.body.style.overflow = ''; // Restaurer le scroll du body
  }
  
  // Mettre à jour l'image affichée dans la modal
  function updateModalImage() {
    if (!modalImage || !modalCategory || !modalCounter || currentImages.length === 0) return;
    
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
  
  // Fonction pour vérifier si le clic est sur l'image ou ses éléments
  function isClickOnImage(target) {
    if (!modalImage) return false;
    // Vérifier si on clique directement sur l'image
    if (target === modalImage) {
      return true;
    }
    // Vérifier si on clique sur un bouton (croix, flèches)
    if (target.closest('button')) {
      return true;
    }
    // Vérifier si on clique sur le wrapper interne (qui contient l'image réelle)
    if (imageInnerWrapper && (target === imageInnerWrapper || target.closest('#image-inner-wrapper'))) {
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
  
  // Centrer le titre avec l'image réelle
  function centerTitleWithImage() {
    const titleContainer = document.getElementById('modal-title-container');
    
    if (titleContainer && imageInnerWrapper && modalImage && modal) {
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
  
  // Fonction d'initialisation
  function initGalleryModal() {
    // Récupérer les éléments DOM à chaque initialisation
    modal = document.getElementById('image-modal');
    modalImage = document.getElementById('modal-image');
    modalCategory = document.getElementById('modal-category');
    modalCounter = document.getElementById('modal-counter');
    modalClose = document.getElementById('modal-close');
    modalPrev = document.getElementById('modal-prev');
    modalNext = document.getElementById('modal-next');
    modalBackdrop = document.getElementById('modal-backdrop');
    imageInnerWrapper = document.getElementById('image-inner-wrapper');
    
    const galleryItems = document.querySelectorAll('.gallery-item');
    
    // Si les éléments essentiels n'existent pas, ne pas initialiser
    if (!modal || !modalImage) return;
    
    // Si pas d'éléments de galerie, ne pas initialiser les event listeners
    if (galleryItems.length === 0) return;
    
    // Ajouter les événements de clic sur les images de la galerie
    galleryItems.forEach(item => {
      // Utiliser once: true pour éviter les doublons, ou retirer d'abord les listeners
      item.removeEventListener('click', handleGalleryItemClick);
      item.addEventListener('click', handleGalleryItemClick);
    });
    
    function handleGalleryItemClick() {
      const category = this.getAttribute('data-category');
      const imageIndex = this.getAttribute('data-image-index');
      openModal(category, imageIndex);
    }
    
    // Événements de la modal - utiliser des fonctions nommées pour pouvoir les retirer
    if (modalClose) {
      modalClose.removeEventListener('click', closeModal);
      modalClose.addEventListener('click', closeModal);
    }
    if (modalPrev) {
      modalPrev.removeEventListener('click', prevImage);
      modalPrev.addEventListener('click', prevImage);
    }
    if (modalNext) {
      modalNext.removeEventListener('click', nextImage);
      modalNext.addEventListener('click', nextImage);
    }
    
    // Fermer en cliquant sur le fond de la modal
    if (modal) {
      modal.removeEventListener('click', handleModalClick);
      modal.addEventListener('click', handleModalClick);
    }
    
    function handleModalClick(e) {
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
    }
    
    // Fermer en cliquant sur le backdrop (zone autour de l'image)
    if (modalBackdrop) {
      modalBackdrop.removeEventListener('click', handleBackdropClick);
      modalBackdrop.addEventListener('click', handleBackdropClick);
    }
    
    function handleBackdropClick(e) {
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
    }
    
    // Améliorer la fermeture sur mobile : permettre le tap en dehors
    let touchStartTime = 0;
    let touchStartTarget = null;
    let touchStartXClose = 0;
    let touchStartYClose = 0;
    
    // Fonction pour gérer le touch sur mobile
    function handleTouchStart(e) {
      if (!modal || modal.classList.contains('hidden')) return;
      
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
      if (!modal || modal.classList.contains('hidden')) return;
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
      modalBackdrop.removeEventListener('touchstart', handleTouchStart);
      modalBackdrop.removeEventListener('touchend', handleTouchEnd);
      modalBackdrop.addEventListener('touchstart', handleTouchStart, { passive: true });
      modalBackdrop.addEventListener('touchend', handleTouchEnd, { passive: false });
    }
    
    // Ajouter les événements sur la modal elle-même
    if (modal) {
      modal.removeEventListener('touchstart', handleTouchStart);
      modal.removeEventListener('touchend', handleTouchEnd);
      modal.addEventListener('touchstart', handleTouchStart, { passive: true });
      modal.addEventListener('touchend', handleTouchEnd, { passive: false });
    }
    
    // Ajuster le titre lors du redimensionnement
    window.removeEventListener('resize', handleResize);
    window.addEventListener('resize', handleResize);
    
    function handleResize() {
      if (modal && !modal.classList.contains('hidden')) {
        setTimeout(centerTitleWithImage, 50);
      }
    }
    
    // Navigation au clavier
    document.removeEventListener('keydown', handleKeydown);
    document.addEventListener('keydown', handleKeydown);
    
    function handleKeydown(e) {
      if (!modal || modal.classList.contains('hidden')) return;
      
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
    }
    
    // Support du swipe sur mobile
    let touchStartX = 0;
    let touchEndX = 0;
    let touchStartY = 0;
    let touchEndY = 0;
    let isSwiping = false;
    
    // Gérer le swipe sur toute la modal pour mobile
    if (modal) {
      modal.removeEventListener('touchstart', handleSwipeStart);
      modal.removeEventListener('touchmove', handleSwipeMove);
      modal.removeEventListener('touchend', handleSwipeEnd);
      
      modal.addEventListener('touchstart', handleSwipeStart, { passive: true });
      modal.addEventListener('touchmove', handleSwipeMove, { passive: true });
      modal.addEventListener('touchend', handleSwipeEnd, { passive: true });
    }
    
    function handleSwipeStart(e) {
      if (modal.classList.contains('hidden')) return;
      touchStartX = e.changedTouches[0].screenX;
      touchStartY = e.changedTouches[0].screenY;
      isSwiping = true;
    }
    
    function handleSwipeMove(e) {
      if (!isSwiping) return;
      // Permettre le scroll vertical si nécessaire
      const currentY = e.changedTouches[0].screenY;
      const diffY = Math.abs(currentY - touchStartY);
      const diffX = Math.abs(e.changedTouches[0].screenX - touchStartX);
      
      // Si le mouvement vertical est plus important, c'est un scroll, pas un swipe
      if (diffY > diffX) {
        isSwiping = false;
      }
    }
    
    function handleSwipeEnd(e) {
      if (!isSwiping) return;
      touchEndX = e.changedTouches[0].screenX;
      touchEndY = e.changedTouches[0].screenY;
      handleSwipe();
      isSwiping = false;
    }
    
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
    let lastTapTime = 0;
    if (modalImage) {
      modalImage.removeEventListener('touchend', handleImageDoubleTap);
      modalImage.addEventListener('touchend', handleImageDoubleTap, { passive: false });
    }
    
    function handleImageDoubleTap(e) {
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
    }
  }
  
  // Initialiser au chargement de la page
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initGalleryModal);
  } else {
    initGalleryModal();
  }
  
  // Réinitialiser lors de la navigation Turbo
  document.addEventListener('turbo:load', function() {
    closeModal();
    initGalleryModal();
  });
  document.addEventListener('turbo:frame-load', function() {
    closeModal();
    initGalleryModal();
  });
})();
