<template>
    <div>
    <v-navigation-drawer
      app
      :temporary="!mini"
      class="primary"
      v-model="drawer"
      dark
      permanent
      :mini-variant.sync="mini"
    >

    <template v-slot:prepend>
        <v-list-item two- class="px-2">
          <v-list-item-avatar>
            <v-img src="@/assets/evax.jpg" />
          </v-list-item-avatar>

          <v-list-item-content>
            <v-list-item-title>{{user.name}}</v-list-item-title>
            <v-list-item-subtitle>{{user.email}}</v-list-item-subtitle>
          </v-list-item-content>

          <v-btn
          icon
          @click.stop="mini = !mini"
        >
          <v-icon>mdi-chevron-left</v-icon>
        </v-btn>
        </v-list-item>
      </template>

      <v-divider></v-divider>
      <v-list>
        <v-list-item
          v-for="item in items"
          :key="item.title"
          link
          :to="item.route"
        >
          <v-list-item-icon>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>

      <template v-slot:append v-if="!mini">
        <div class="pa-2">
          <v-btn class="white primary--text" @click="logout" block>
            <v-icon
            class="mx-2">
              mdi-logout
            </v-icon>
            Logout
          </v-btn>
        </div>
      </template>
    </v-navigation-drawer>
    </div>
</template>
<script>
  import { mapActions, mapGetters } from "vuex";

  export default {
    data () {
      return {
        drawer: true,
        items: [
          { title: 'Profile', icon: 'mdi-account', route: '/home/profile' },
          { title: 'Vaccines', icon: 'mdi-needle', route: '/home/vaccines' },
        ],
        mini: true,
        account: null,
      }
    },
    methods: {
      ...mapActions(['signOut']),
      logout() {
        this.signOut()
        this.$router.push('/')
      }
    },
    computed: {
      ...mapGetters({
            user: 'currentUser'
      }
      )
    }

  }
</script>