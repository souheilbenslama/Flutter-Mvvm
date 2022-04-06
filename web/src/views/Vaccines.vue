<template>
    <div>
        <div class="text-h5">
            <v-icon
            color="primary"
            >
                mdi-needle
            </v-icon> 
            Vaccines
        </div>
        <ic-vaccines />
    </div>
</template>
<script>
import IcVaccines from '../components/IcVaccines.vue'

export default {
    components: {
        IcVaccines,
    }
}
</script>