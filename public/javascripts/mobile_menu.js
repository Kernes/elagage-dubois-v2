// Fonction pour initialiser le menu mobile
function initMobileMenu() {
  const menuButton = document.getElementById('mobile-menu-button');
  const menuClose = document.getElementById('mobile-menu-close');
  const mobileMenu = document.getElementById('mobile-menu');
  
  if (!menuButton || !menuClose || !mobileMenu) return;
  
  // Retirer les anciens event listeners en clonant les éléments
  const newMenuButton = menuButton.cloneNode(true);
  const newMenuClose = menuClose.cloneNode(true);
  menuButton.parentNode.replaceChild(newMenuButton, menuButton);
  menuClose.parentNode.replaceChild(newMenuClose, menuClose);
  
  // Ajouter les nouveaux event listeners
  newMenuButton.addEventListener('click', function() {
    mobileMenu.classList.remove('hidden');
  });
  
  newMenuClose.addEventListener('click', function() {
    mobileMenu.classList.add('hidden');
  });
  
  // Fermer le menu en cliquant sur un lien
  const menuLinks = mobileMenu.querySelectorAll('a');
  menuLinks.forEach(link => {
    link.addEventListener('click', function() {
      mobileMenu.classList.add('hidden');
    });
  });
}

// Initialiser au chargement de la page
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initMobileMenu);
} else {
  initMobileMenu();
}

// Réinitialiser lors de la navigation Turbo
document.addEventListener('turbo:load', initMobileMenu);
document.addEventListener('turbo:frame-load', initMobileMenu);

