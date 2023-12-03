<script setup>
useHead({
  link: [
    {
      type: 'text/yaml',
      rel: 'cms-config-url',
      href: 'writer/config.yml',
    },
  ],
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
  <div class="flex flex-col min-h-screen dark:bg-slate-950 bg-white">
    <div class="min-h-screen h-full">
      <The.Navbar />
      <div class="flex flex-row w-100 pt-4">
        <div class="flex flex-grow overflow-y-auto no-scrollbar">
          <AdminAside />
          <div class="flex flex-1 min-w-0 px-2">
            <slot />
            <div class="drawer drawer-end">
              <input
                id="my-drawer-4"
                type="checkbox"
                class="drawer-toggle"
              />
              <div class="drawer-side">
                <label
                  for="my-drawer-4"
                  aria-label="close sidebar"
                  class="drawer-overlay"
                ></label>
                <ul
                  class="menu p-4 w-80 min-h-full bg-base-200 text-base-content"
                >
                  <li><a>Sidebar Item 1</a></li>
                  <li><a>Sidebar Item 2</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
