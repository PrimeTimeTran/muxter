<script setup>
const route = useRoute()
const isAdmin = route.fullPath.split('/')[1] === 'admin'
const items = isAdmin ? adminNavItems : navItems
</script>
<template>
  <div
    class="flex flex-start flex-grow sm:justify-center md:justify-start space-x-5 m-auto w-full border-b-2 sm:border-b-cyan-300 md:border-b-0"
  >
    <NuxtLink
      :to="item.url"
      :key="item.name"
      v-for="item in items"
      class="flex flex-auto lg:flex-none items-center lg:px-6 py-3 text-gray-500 hover:text-green-400 dark:text-white dark:hover:text-green-400 cursor-pointer transition-colors duration-300 text-xs font-bold"
    >
      <FontAwesomeIcon :icon="item.icon" class="mr-3" />
      {{ item.name }}
    </NuxtLink>
  </div>
  <The.NavbarRight id="navItems-right" />
</template>
