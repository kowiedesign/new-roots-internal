// Shared nav behavior across all pages.
// Each page sets <body data-page="dashboard|decision|immigration|finances|operations">.

document.addEventListener('DOMContentLoaded', () => {
  const page = document.body.getAttribute('data-page');
  document.querySelectorAll('nav.toplinks a[data-nav]').forEach(link => {
    if (link.getAttribute('data-nav') === page) {
      link.classList.add('active');
    }
  });

  const toggle = document.getElementById('navToggle');
  const links = document.getElementById('topLinks');
  if (toggle && links) {
    toggle.addEventListener('click', () => {
      links.classList.toggle('open');
    });
  }
});
