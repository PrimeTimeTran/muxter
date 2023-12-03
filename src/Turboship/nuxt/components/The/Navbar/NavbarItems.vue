<script setup>
const route = useRoute()
const isAdmin = route.fullPath.split('/')[1] === 'administrator'
const items = isAdmin ? adminNavItems : navItems
</script>
<template>
  <NuxtLink
    :to="item.url"
    :key="item.name"
    v-for="item in items"
    class="flex lg:flex-none items-center lg:px-6 py-3 text-gray-500 hover:text-green-400 dark:text-white dark:hover:text-green-400 cursor-pointer transition-colors duration-300 text-xs font-bold"
  >
    <FontAwesomeIcon :icon="item.icon" class="mr-3" />
    <span v-text="item.name"></span>
  </NuxtLink>
  <TheNavbarRight id="navItems-right" />
</template>
