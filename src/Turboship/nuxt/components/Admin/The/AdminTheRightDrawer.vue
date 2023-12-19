<template>
  <div class="drawer drawer-end z-auto">
    <input id="rightDrawer" type="checkbox" class="drawer-toggle" />
    <div class="drawer-content"></div>
    <div class="drawer-side z-10">
      <label for="rightDrawer" aria-label="close sidebar" class="drawer-overlay"></label>
      <ul class="menu p-4 w-4/6 min-h-full bg-slate-200 dark:bg-base-200 text-base-content">
        <li v-for="item in sidebarItems" :key="item.id">
          <a>{{ item.label }}</a>
        </li>
        <slot />
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      sidebarItems: [
        { id: 1, label: 'Injected Item 1' },
        { id: 2, label: 'Injected Item 2' },
      ],
    }
  },
}
</script>
