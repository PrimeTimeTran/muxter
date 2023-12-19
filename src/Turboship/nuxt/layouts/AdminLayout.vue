<script setup>
useHead({
  link: [],
  script: [
    {
      innerHTML: 'console.log("Admin scripts loading...")',
      tagPosition: 'head',
    },
    {
      src: 'https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js',
      tagPosition: 'head',
    },
  ],
})
ensureLoad('https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js')
</script>

<template>
  <div class="drawer lg:drawer-open max-h-screen overflow-auto scrollbar-hide bg-white dark:bg-base-300">
    <VGlobals />
    <input type="checkbox" class="drawer-toggle" />
    <div class="drawer-content p-2">
      <AdminTheRightDrawer />
      <slot />
    </div>
    <AdminTheLeftSidebar />
  </div>
</template>
