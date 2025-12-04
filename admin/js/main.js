const btn = document.getElementById("toggleBtn");
    const sidebar = document.getElementById("sidebar");
    const icon = document.getElementById("toggleIcon");

    btn.addEventListener("click", () => {
      const open = sidebar.classList.toggle("left-0");
      sidebar.classList.toggle("-left-[300px]");


      icon.className = open ? "ri-close-line" : "ri-menu-line";
    });