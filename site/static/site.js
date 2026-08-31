(function () {
  const input = document.querySelector('[data-filter]');
  if (!input) return;
  const rows = document.querySelectorAll('[data-filter-row]');
  input.addEventListener('input', function () {
    const query = input.value.trim().toLowerCase();
    rows.forEach(function (row) { row.hidden = query && !row.textContent.toLowerCase().includes(query); });
  });
}());
