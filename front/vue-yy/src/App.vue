<script setup>

</script>

<template>
  <div id="app">
    <RouterView />
  </div>
</template>


<style scoped>
#app {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100vh; /* 确保高度为视口高度 */
}

/* 确保 RouterView 占满整个父容器 */
router-view {
  display: flex;
  flex-direction: column;
  width: 100%;
  height: 100%;
}
</style>

