<template>
  <div class="users">
    <div v-for="user in data" :key="user.id">
      <ul>
        <li>{{ user.id }}</li>
        <li>{{ user.name }}</li>
        <li>{{ user.bio }}</li>
        <li>{{ user.profession }}</li>
        <li>{{ user.location }}</li>
        <li>{{ user.website }}</li>
        <li>{{ user.joined_date }}</li>
        <li>{{ user.following }}</li>
        <li>{{ user.followers }}</li>
        <li>{{ user.birthday }}</li>
      </ul>
    </div>
  </div>
</template>

<script setup lang="ts">
interface User {
  user: {
    id: number,
    name: String,
    bio?: String
    profession?: String
    location?: String
    website?: String
    joined_date: Date
    following: Number
    followers: Number
    birthday: Date
  }
}

import gql from 'graphql-tag';

const getUsers = gql`
  query getUsers {
    user {
      id
      name
      bio
      profession
      location
      website
      joined_date
      following
      followers
      birthday
    }
  }
`
const { data, refresh } = await useAsyncQuery<User>(getUsers);
</script>