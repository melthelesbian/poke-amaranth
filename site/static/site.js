(function () {
  const input = document.querySelector('[data-filter]');
  if (input) {
    const rows = document.querySelectorAll('[data-filter-row]');
    input.addEventListener('input', function () {
      const query = input.value.trim().toLowerCase();
      rows.forEach(function (row) { row.hidden = query && !row.textContent.toLowerCase().includes(query); });
    });
  }

  document.querySelectorAll('table[data-sortable]').forEach(function (table) {
    table.querySelectorAll('thead th').forEach(function (header, column) {
      header.tabIndex = 0;
      header.setAttribute('aria-sort', 'none');
      function sort() {
        const ascending = header.getAttribute('aria-sort') !== 'ascending';
        table.querySelectorAll('thead th').forEach(function (cell) { cell.setAttribute('aria-sort', 'none'); });
        header.setAttribute('aria-sort', ascending ? 'ascending' : 'descending');
        const body = table.tBodies[0];
        Array.from(body.rows).sort(function (left, right) {
          const a = left.cells[column].dataset.sortValue || left.cells[column].textContent.trim();
          const b = right.cells[column].dataset.sortValue || right.cells[column].textContent.trim();
          const number = /^[-+]?[$₽]?\s*\d[\d,.]*%?$/;
          const result = number.test(a) && number.test(b)
            ? parseFloat(a.replace(/[^\d.+-]/g, '')) - parseFloat(b.replace(/[^\d.+-]/g, ''))
            : a.localeCompare(b, undefined, { numeric: true, sensitivity: 'base' });
          return (ascending ? result : -result);
        }).forEach(function (row) { body.appendChild(row); });
      }
      header.addEventListener('click', sort);
      header.addEventListener('keydown', function (event) {
        if (event.key === 'Enter' || event.key === ' ') { event.preventDefault(); sort(); }
      });
    });
  });
}());
