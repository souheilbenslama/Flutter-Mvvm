<template>
  <div class="background d-flex justify-center align-center">
    <v-card width="600" height="500" class="grey lighten-3">
      <v-card-title class="primary white--text d-flex justify-center">
        <h2>
          <v-icon
           large
           class="white--text"
          >
            mdi-edit
          </v-icon>
          Register
        </h2>
      </v-card-title>
      <v-card-text class="d-flex justify-center">
          <v-container>
            <v-row no-gutters>
              <v-col cols="12">
                <div class="d-flex justify-center ma-5">
                  <img height="100" src="../assets/evax.jpg" />
                </div>
              </v-col>
            </v-row>
            <form>
            <v-row no-gutters>
              <v-col cols="6">
                <v-text-field
                class="mr-2"
                  v-model="email"
                  :error-messages="emailErrors"
                  @input="$v.email.$touch()"
                  @blur="$v.email.$touch()"
                  label="Email"
                  prepend-inner-icon="mdi-at"
                  outlined
                  dense
                ></v-text-field>
              </v-col>
              <v-col cols="6">
                <v-text-field
                  v-model="name"
                  label="Name"
                  prepend-inner-icon="mdi-pencil"
                  outlined
                  dense
                ></v-text-field>
              </v-col>
            </v-row>
                        <v-row no-gutters>
              <v-col cols="6" >
                <v-text-field
                type="date"
                class="mr-2"
                  v-model="birthdate"
                  label="Birthdate"
                  prepend-inner-icon="mdi-calendar"
                  outlined
                  dense
                ></v-text-field>
              </v-col>
              <v-col cols="6">
                <v-text-field
                  v-model="address"
                  label="Adress"
                  prepend-inner-icon="mdi-pencil"
                  outlined
                  dense
                ></v-text-field>
              </v-col>
            </v-row>
            <v-row no-gutters>
              <v-col cols="6">
                <v-text-field
                v-model="password"
                  :error-messages="passwordErrors"
                  required
                  @input="$v.password.$touch()"
                  @blur="$v.password.$touch()"
                  label="Password"
                  type="password"
                  outlined
                   prepend-inner-icon="mdi-key"
                  dense
                ></v-text-field>
              </v-col>
            </v-row>
            <v-row no-gutters >
                <v-col cols="12" class="d-flex justify-center mb-4">
                    <v-alert v-if="error" dense type="error">
                        {{error}}
                    </v-alert>
                    <v-progress-circular
                      class="d-flex justify-center"
                      v-if="loading"
                      :size="50"
                      :width="5"
                      color="accent"
                      indeterminate
                    ></v-progress-circular>
                </v-col>
            </v-row>
            <v-row no-gutters>
              <v-col cols="12" class="d-flex justify-center">
                <v-btn @click="submit"  class="primary white--text">Register</v-btn>
              </v-col>
              <v-col cols="12" class="d-flex justify-center">
                <v-btn x-small @click="$router.push('/')"  class="mt-2 primary white--text">Connexion</v-btn>
              </v-col>
            </v-row>
            </form>
          </v-container>
      </v-card-text>
    </v-card>
  </div>
</template>
<script>
import { required,  email } from 'vuelidate/lib/validators'
import { validationMixin } from 'vuelidate'
import { mapActions } from "vuex"

export default {
  name: 'Login',
  mixins: [validationMixin],
  data: () => ({
    email: '',
    password: '',
    address: '',
    birthdate: '',
    name: '',
    error: '',
    loading: false,
  }),
  methods: {
    ...mapActions(["setUser"]),
    submit () {
        this.$v.$touch()
        if(!this.$v.$errors){
            this.error = ''
            this.loading = true

            // Request Body
            let body = {
              email: this.email,
              password: this.password,
              address: this.address,
              birthdate: this.birthdate,
              name: this.name,
            }
             
            //Login
            this.$Axios.post('signup',body)
            .then(() => {
              // Navigate to the account
                this.$router.push('/')
            })
            .catch((err) => {
               if(err.response == undefined) {
                  this.error = "Server Error !"
                  return
               }

               if(err.response.status == 400) {
                  this.error = "Email or Password is invalid !"
               }
               if(err.response.status == 500) {
                  this.error = "Server Error !"
               }
            })
            .finally(() => {
              this.loading = false
            })
        }
      },
      clear () {
        this.$v.$reset()
        this.email = ''
        this.password = ''
        this.error = ''
      },
  },
  computed: {
    emailErrors () {
        const errors = []
        if (!this.$v.email.$dirty) return errors
        !this.$v.email.email && errors.push('Must be valid e-mail !')
        !this.$v.email.required && errors.push('E-mail is required !')
        return errors
      },
    passwordErrors () {
        const errors = []
        if (!this.$v.password.$dirty) return errors
        !this.$v.password.required && errors.push('Password is required !')
        return errors
      },
  },
  validations: {
    email: {
      required,
      email,
    },
    password: {
      required,
    },
  },
};
</script>
<style scoped>

.background {
background-color: #c93030;
  width: 100%;
  height: 100%;
  background-position: top;
  background-repeat: no-repeat;
  background-size: cover;
}
</style>
