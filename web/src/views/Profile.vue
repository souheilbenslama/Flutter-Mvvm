<template>
  <div class="about">
    

    <v-card>
      <v-card-title class="primary white--text">
        <h2><v-icon color="white">mdi-account</v-icon> Profile</h2>
      </v-card-title>
      <v-card-text class="pa-2">
      <v-row>
        <v-col cols="6">
          name:
        </v-col>
        <v-col cols="6">
          {{user.name}}
        </v-col>
      </v-row>
            <v-row>
        <v-col cols="6">
          email:
        </v-col>
        <v-col cols="6">
          {{user.email}}
        </v-col>
      </v-row>
            <v-row>
        <v-col cols="6">
          address:
        </v-col>
        <v-col cols="6">
          {{user.address}}
        </v-col>
      </v-row>
      <v-row>
        <v-col cols="6">
          Birthdate:
        </v-col>
        <v-col cols="6">
          {{user.birthdate}}
        </v-col>
      </v-row>
      </v-card-text>
    </v-card>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
export default {
  name: 'Clients',
  data: () => ({
    loading: true,
    btnLoading: false,
    apiUrl: process.env.VUE_APP_API_URL,
    dialog: false,
    dialogDelete: false,
    error: '',
    vaccines: [],
  }),

  created() {
    this.getVaccines();
  },

  methods: {
    // Vaccines API Calls
    getVaccines() {
      this.$Axios
        .get('vaccines', {account: this.user._id})
        .then((res) => {
          console.log(res.data)
          this.vaccines = res.data;
        })
        .catch((e) => {
          console.log(e);
        })
    },
  },
  computed: {
    ...mapGetters({
      user: 'currentUser'
    })
  }
};
</script>
