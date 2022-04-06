<template>
  <div>
     <the-ic-drawer />
     <v-container>
        <router-view/>
     </v-container>
  </div>
</template>

<script>
  import TheIcDrawer from '../components/TheIcDrawer'

  export default {
    name: 'Home',

    components: {
       TheIcDrawer,
    },
  }
</script>
