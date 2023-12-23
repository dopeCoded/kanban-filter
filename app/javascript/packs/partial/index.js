document.addEventListener('DOMContentLoaded', function() {
  document.getElementById('close-nav-panel').addEventListener('click', function() {
      document.getElementById('navPanel').style.display = 'none';
  });

  document.getElementById('open-nav-panel').addEventListener('click', function() {
      document.getElementById('navPanel').style.display = 'block';
  });

  if (window.innerWidth < 600) {
      document.getElementById('signout').remove();
      document.getElementById('create-list').remove();
      document.getElementById('open-nav-panel').style.display = 'block';
  }
});