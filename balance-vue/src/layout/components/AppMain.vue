<template>
  <section class="app-main">
    <transition name="fade-transform" mode="out-in">
      <keep-alive :include="cachedViews">
        <router-view :key="key" />
      </keep-alive>
    </transition>
  </section>
</template>

<script>
export default {
  name: 'AppMain',
  computed: {
    cachedViews() {
      const cachedViewsTmp = this.$store.state.tagsView.cachedViews
      return cachedViewsTmp
    },
    key() {
      const fullPath = this.$route.fullPath
      return fullPath
    }
  }
}
</script>

<style lang="scss" scoped>
.app-main {
  /* 86 = navbar + footer = 50 + 36  */
  min-height: calc(100vh - 86px);
  width: 100%;
  position: relative;
  overflow: hidden;
}

.fixed-header + .app-main {
  padding-top: 50px;
}

.hasTagsView {
  .app-main {
    /* 120 = navbar + tags-view + footer = 50 + 34 + 36 */
    min-height: calc(100vh - 120px);
  }

  .fixed-header + .app-main {
    padding-top: 84px;
  }
}
</style>
