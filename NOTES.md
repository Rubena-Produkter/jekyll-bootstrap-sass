Inspiration from:  
https://medium.com/codex/how-to-add-bootstrap-5-sass-to-jekyll-e3b189f71552 (https://github.com/robinkloeckner/jekyll_bootstrap5_sass/tree/master/02_scss_individual)  
https://medium.com/@munawarn/tutorial-implement-dark-mode-with-bootstrap-5-3-with-a-sliding-toggle-switch-fd19158b598d 

# Bootstrap 5.3 darkmode alternatives  

# Alternative 1  
https://codepen.io/nouraldeen26sh/pen/vYQXbZO

## HTML
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
      <ul class="navbar-nav">
        <li class="nav-item dropdown">
          <button class="btn btn-link px-0 text-decoration-none dropdown-toggle d-flex align-items-center" id="bd-theme" type="button" aria-expanded="false" data-bs-toggle="dropdown" data-bs-display="static">
            <svg class="bi my-1 me-2 theme-icon-active">
              <use href="#circle-half"></use>
            </svg>
            <span class="ms-2" id="bd-theme-text"></span>
          </button>
          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="bd-theme" style="--bs-dropdown-min-width: 8rem;">
            <li>
              <button type="button" class="dropdown-item mode d-flex align-items-center" data-bs-theme-value="light">
                <svg class="bi me-2 opacity-50 theme-icon">
                  <use href="#sun-fill"></use>
                </svg>
                Light
                <svg class="bi ms-auto d-none">
                  <use href="#check2"></use>
                </svg>
              </button>
            </li>
            <li>
              <button type="button" class="dropdown-item mode d-flex align-items-center" data-bs-theme-value="dark">
                <svg class="bi me-2 opacity-50 theme-icon">
                  <use href="#moon-stars-fill"></use>
                </svg>
                Dark
                <svg class="bi ms-auto d-none">
                  <use href="#check2"></use>
                </svg>
              </button>
            </li>
            <li>
              <button type="button" class="dropdown-item mode d-flex align-items-center active" data-bs-theme-value="auto">
                <svg class="bi me-2 opacity-50 theme-icon">
                  <use href="#circle-half"></use>
                </svg>
                Auto
                <svg class="bi ms-auto d-none">
                  <use href="#check2"></use>
                </svg>
              </button>
            </li>
          </ul>
    </div>
    </li>
    </ul>
    </li>
    </ul>
  </div>
  </div>
</nav>

## CSS
.bi {
  width: 1em;
  height: 1em;
  vertical-align: -0.125em;
  fill: currentcolor;
}
.bd-gutter {
  --bs-gutter-x: 3rem;
}
.dropdown-menu-end {
  --bs-dropdown-min-width: 8rem !important;
  padding: 4px !important;
}
.dropdown-menu .dropdown-item {
  border-radius: 0.25rem !important;
}
.dropdown-item {
  border-radius: 0.25rem !important;
}
.mode {
  justify-content: space-between;
  flex-direction: row-reverse;
}

## JS
(() => {
  "use strict";

  const getStoredTheme = () => localStorage.getItem("theme");
  const setStoredTheme = (theme) => localStorage.setItem("theme", theme);

  const getPreferredTheme = () => {
    const storedTheme = getStoredTheme();
    if (storedTheme) {
      return storedTheme;
    }

    return window.matchMedia("(prefers-color-scheme: dark)").matches
      ? "dark"
      : "light";
  };

  const setTheme = (theme) => {
    if (
      theme === "auto" &&
      window.matchMedia("(prefers-color-scheme: dark)").matches
    ) {
      document.documentElement.setAttribute("data-bs-theme", "dark");
    } else {
      document.documentElement.setAttribute("data-bs-theme", theme);
    }
  };

  setTheme(getPreferredTheme());

  const showActiveTheme = (theme, focus = false) => {
    const themeSwitcher = document.querySelector("#bd-theme");

    if (!themeSwitcher) {
      return;
    }

    const themeSwitcherText = document.querySelector("#bd-theme-text");
    const activeThemeIcon = document.querySelector(".theme-icon-active use");
    const btnToActive = document.querySelector(
      `[data-bs-theme-value="${theme}"]`
    );
    const svgOfActiveBtn = btnToActive
      .querySelector("svg use")
      .getAttribute("href");

    document.querySelectorAll("[data-bs-theme-value]").forEach((element) => {
      element.classList.remove("active");
      element.setAttribute("aria-pressed", "false");
    });

    btnToActive.classList.add("active");
    btnToActive.setAttribute("aria-pressed", "true");
    activeThemeIcon.setAttribute("href", svgOfActiveBtn);
    const themeSwitcherLabel = `${themeSwitcherText.textContent} (${btnToActive.dataset.bsThemeValue})`;
    themeSwitcher.setAttribute("aria-label", themeSwitcherLabel);

    if (focus) {
      themeSwitcher.focus();
    }
  };

  window
    .matchMedia("(prefers-color-scheme: dark)")
    .addEventListener("change", () => {
      const storedTheme = getStoredTheme();
      if (storedTheme !== "light" && storedTheme !== "dark") {
        setTheme(getPreferredTheme());
      }
    });

  window.addEventListener("DOMContentLoaded", () => {
    showActiveTheme(getPreferredTheme());

    document.querySelectorAll("[data-bs-theme-value]").forEach((toggle) => {
      toggle.addEventListener("click", () => {
        const theme = toggle.getAttribute("data-bs-theme-value");
        setStoredTheme(theme);
        setTheme(theme);
        showActiveTheme(theme, true);
      });
    });
  });
})();

# Alternative 2  
https://www.codethepixel.com/articles/Dark-Mode-in-Bootstrap-5-3-3

## HTML  
<div class="form-check form-switch">
        <input class="form-check-input" type="checkbox" id="darkModeToggle" />
        <label class="form-check-label" for="darkModeToggle" id="themeLabel">Dark Mode</label>
</div>

## JS  
function setTheme(theme){
    document.documentElement.setAttribute("data-bs-theme", theme);
    localStorage.setItem("theme",theme);
    document.getElementById("themeLabel").innerText = 
        theme === "dark" ? "Dark Mode On" : "Dark Mode Off";
}

document
    .getElementById("darkModeToggle")
    .addEventListener("change", function (event) {
        if (event.target.checked) {
            setTheme("dark");
        } else {
            setTheme("");
        }
    });

    window.onload = function () {
        let savedTheme = localStorage.getItem("theme");
        if(savedTheme) {
            setTheme(savedTheme);
            if (savedTheme === "dark") {
                document.getElementById("darkModeToggle").checked = true;
            }
        }
    };

    # Alternative 3  
    https://medium.com/@munawarn/tutorial-implement-dark-mode-with-bootstrap-5-3-with-a-sliding-toggle-switch-fd19158b598d

    # Alternative 4  
    https://codepen.io/inputekno/pen/XWxwMEx
