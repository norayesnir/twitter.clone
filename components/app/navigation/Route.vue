<template>
  <ul class="routes">
    <NuxtLink
      @click="navigation.toggleNavigation"
      v-for="route in reversedRoutes"
      class="route"
      :key="route.path"
      :to="route.path"
    >
      {{ route.name }}
    </NuxtLink>
  </ul>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router'

import { useNavigationMenuStore } from "~/stores/navigationMenuStore"
const navigation = useNavigationMenuStore();

const router = useRouter()
const filteredRoutes = router.getRoutes().filter(route => route.path !== '/');
const reversedRoutes = filteredRoutes.slice().reverse();
</script>

<style scoped lang="scss">
.routes{
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 6px;

  .route{
    padding: 0px 10px;
    font-size: 16px;
    text-transform: capitalize;

    &:hover{
      opacity: .8;
      color: var(--primary);
    }
  }
}

.router-link-active{
  color: var(--primary);
  background: -webkit-linear-gradient(45deg, var(--primary), var(--accent));
  background-clip: text;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

@media screen and (max-width: 550px) {

  .route{
    padding-left: 0 !important;
    font-size: 28px !important;
    font-weight: 900;
  }
}
</style>