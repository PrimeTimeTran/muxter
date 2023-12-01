<script setup>
const percent = ref(0)
const showMenu = ref(false)
const client = process.browser && window.location.pathname != '/login'
function appInit() {
  if (client) {
    window?.addEventListener('scroll', () => {
      let winScroll = document.body.scrollTop || document.documentElement.scrollTop
      let height = document.documentElement.scrollHeight - document.documentElement.clientHeight

      percent.value = Math.round((winScroll / height) * 100)
    })
  }
}
function appData() {
  if (client) return { percent }
}
function toggleNavbar() {
  showMenu.value = !showMenu.value
}
const route = useRoute()
</script>

<template>
  <div x-cloak :x-data="appData()" :x-init="appInit()" class="flex flex-col items-center justify-center">
    <The.NavbarScrollSpy :percent="percent" />
    <nav
      class="z-40 fixed top-0 left-0 right-0 w-screen flex flex-wrap items-center justify-around bg-white dark:bg-neutral-950 backdrop-blur-md border-b-2 border-b-gray-300 dark:border-b-zinc-800"
    >
      <div
        class="flex flex-wrap flex-grow items-center justify-between md:flex-col md:flex-start lg:flex-row lg:px-3 px-3"
      >
        <div class="flex relative w-full justify-between lg:w-auto px-4 lg:justify-start py-1">
          <The.NavbarLogo />
          <NuxtLink
            type="button"
            @click="toggleNavbar"
            class="flex items-center lg:hidden text-gray-500 dark:hover:opacity-50 cursor-pointer text-xl leading-none border border-solid border-transparent rounded bg-transparent outline-none focus:outline-none hover:cursor-pointer"
          >
            <FontAwesomeIcon icon="fa-solid fa-bars" />
          </NuxtLink>
        </div>
        <div
          class="flex flex-col-reverse px-12 flex-auto md:px-4 md:flex-row lg:flex lg:flex-grow md:min-w-100 md:min-w-full lg:min-w-0"
          v-bind:class="{ hidden: !showMenu, flex: showMenu }"
        >
          <The.NavbarItems />
        </div>
      </div>
    </nav>
  </div>
</template>
