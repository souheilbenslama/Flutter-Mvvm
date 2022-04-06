<template>
<div>
     <v-card class="mt-2" v-for="vaccine, index in vaccines" :key="vaccine._id">
       <v-card-title class="primary white--text" >
         Vaccine {{index + 1}}
       </v-card-title>
       <v-card-text class="pa-2">
         <v-row no-gutters>
           <v-col cols="6">
             Name : 
           </v-col>
           <v-col cols="6">
             {{vaccine.name}}
           </v-col>
         </v-row>
                  <v-row no-gutters>
           <v-col cols="6">
             Time : 
           </v-col>
           <v-col cols="6">
             {{vaccine.time}}
           </v-col>
         </v-row>
         <v-row no-gutters>
           <v-col cols="6">
             Date : 
           </v-col>
           <v-col cols="6">
             {{vaccine.date}}
           </v-col>
         </v-row>
         <v-row no-gutters>
           <v-col cols="6">
             Place : 
           </v-col>
           <v-col cols="6">
             {{vaccine.place}}
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
