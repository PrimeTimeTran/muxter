<template>
  <div
    class="flex flex-grow flex-col lg:items-center lg:align-middle lg:flex-row space-x-5 border-t border-t-white border-b-white lg:border-t-0 lg:border-b-0"
  >
    <div @click="toggleTheme()" class="flex sm:flex-col lg:flex-row ml-3 py-3">
      <input type="checkbox" name="light-switch" class="light-switch sr-only" />
      <label for="light-switch" class="relative cursor-pointer p-2 hover:text-gray-900 dark:hover:text-yellow-500">
        <svg
          width="16"
          height="16"
          fill="currentColor"
          class="bi bi-moon dark:hidden"
          viewBox="0 0 16 16"
          xmlns="http://www.w3.org/2000/svg"
        >
          <path
            d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278zM4.858 1.311A7.269 7.269 0 0 0 1.025 7.71c0 4.02 3.279 7.276 7.319 7.276a7.316 7.316 0 0 0 5.205-2.162c-.337.042-.68.063-1.029.063-4.61 0-8.343-3.714-8.343-8.29 0-1.167.242-2.278.681-3.286z"
          />
        </svg>
        <svg width="16" height="16" class="hidden dark:block dark:fill-yellow-200" xmlns="http://www.w3.org/2000/svg">
          <path
            class="hidden dark:block dark:fill-yellow-200"
            d="M7 0h2v2H7zM12.88 1.637l1.414 1.415-1.415 1.413-1.413-1.414zM14 7h2v2h-2zM12.95 14.433l-1.414-1.413 1.413-1.415 1.415 1.414zM7 14h2v2H7zM2.98 14.364l-1.413-1.415 1.414-1.414 1.414 1.415zM0 7h2v2H0zM3.05 1.706 4.463 3.12 3.05 4.535 1.636 3.12z"
          />
          <path d="M8 4C5.8 4 4 5.8 4 8s1.8 4 4 4 4-1.8 4-4-1.8-4-4-4Z" />
        </svg>
      </label>
    </div>
    <NuxtLink
      href="/login"
      class="flex flex-row lg:justify-center lg:items-center py-3 text-gray-500 dark:text-white hover:text-green-400 dark:hover:text-green-400 cursor-pointer transition-colors duration-300"
    >
      <svg
        width="24"
        height="24"
        version="1.1"
        viewBox="0 0 24 24"
        xmlns="http://www.w3.org/2000/svg"
        class="fill-current h-5 w-5 mr-2 mt-0.5"
        xmlns:xlink="http://www.w3.org/1999/xlink"
      >
        <path
          class="mr-3"
          d="M12 0L11.34 .03L15.15 3.84L16.5 2.5C19.75 4.07 22.09 7.24 22.45 11H23.95C23.44 4.84 18.29 0 12 0M12 4C10.07 4 8.5 5.57 8.5 7.5C8.5 9.43 10.07 11 12 11C13.93 11 15.5 9.43 15.5 7.5C15.5 5.57 13.93 4 12 4M12 6C12.83 6 13.5 6.67 13.5 7.5C13.5 8.33 12.83 9 12 9C11.17 9 10.5 8.33 10.5 7.5C10.5 6.67 11.17 6 12 6M.05 13C.56 19.16 5.71 24 12 24L12.66 23.97L8.85 20.16L7.5 21.5C4.25 19.94 1.91 16.76 1.55 13H.05M12 13C8.13 13 5 14.57 5 16.5V18H19V16.5C19 14.57 15.87 13 12 13M12 15C14.11 15 15.61 15.53 16.39 16H7.61C8.39 15.53 9.89 15 12 15Z"
        />
      </svg>
      Register
    </NuxtLink>

    <NuxtLink
      href="/login"
      class="flex items-center text-gray-500 dark:text-white hover:text-gray-900 cursor-pointer transition-colors duration-300 py-3"
    >
      <FontAwesomeIcon icon="fa-solid fa-sign-out" class="mr-3" />
      Login
    </NuxtLink>
  </div>
</template>
