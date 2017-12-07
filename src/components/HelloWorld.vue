<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <h2>Links to CodeDevils</h2>
    <ul>
      <li><a href="http://codedevils.org" target="_blank">CodeDevils.org</a></li>
      <li><a href="https://codedevils.slack.com" target="_blank">CodeDevils Slack</a></li>
      <li><a href="https://github.com/ASU-CodeDevils/Brewfection" target="_blank">CodeDevils Brewfection GitHub</a></li>
      <br>
      <li><a href="http://vuejs-templates.github.io/webpack/" target="_blank">Docs for This Template</a></li>
    </ul>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  data () {
    return {
      msg: 'Welcome to Brewfection!'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
