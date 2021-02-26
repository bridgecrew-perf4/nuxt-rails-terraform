<template>
  <div>
    <button type="button" name="button" @click="getMsg">
      RailsからAPIを取得する(通常)
    </button>
    <button type="button" name="button" @click="getMsg2">
      RailsからAPIを取得する(ドメイン)
    </button>
    <button type="button" name="button" @click="getMs3g">
      RailsからAPIを取得する(alb)
    </button>
    <button type="button" name="button" @click="getMsg4">
      RailsからAPIを取得する(ローカル)
    </button>

    <div v-for="(msg, i) in msgs" :key="i">
      {{ msg }}
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      msgs: []
    }
  },
  methods: {
    getMsg () {
      this.$axios.$get('/api/v1/hello').then(res => this.msgs.push(res))
    },
    getMsg2 () {
      this.$axios.$get('https://nuxt-rails.com:3000/api/v1/hello').then(res => this.msgs.push(res))
    },
    getMsg3 () {
      this.$axios.$get('https://nuxt-rails-alb-1270301701.ap-northeast-1.elb.amazonaws.com:3000/api/v1/hello').then(res => this.msgs.push(res))
    },
    getMsg4 () {
      this.$axios.$get('http://localhost:3000/api/v1/hello').then(res => this.msgs.push(res))
    }

  }
}
</script>
