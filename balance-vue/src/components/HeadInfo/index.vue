<template>
  <div class="head-info" :class="center && 'center'">
    <span>{{ title }}</span>
    <p>{{ content }}</p>
  </div>
</template>

<script>
export default {
  name: 'HeadInfo',
  props: {
    title: {
      type: String,
      default: ''
    },
    content: {
      type: Number,
      default: 0
    },
    bordered: {
      type: Boolean,
      default: true
    },
    center: {
      type: Boolean,
      default: true
    }
  }
}
</script>

<style lang="scss" scoped>
  .head-info {
    position: relative;
    text-align: left;
    padding: 0 32px 0 0;
    min-width: 125px;

    &.center {
      text-align: center;
      padding: 0 32px;
    }

    span {
      color: #555555;
      display: inline-block;
      font-size: .95rem;
      line-height: 32px;
      margin-bottom: 4px;
    }
    p {
      line-height: 32px;
      margin: 0;
      a {
        font-weight: 600;
        font-size: 1rem;
      }
    }
  }
</style>
