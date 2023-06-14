export interface User {
  id: number
  name: string
  bio?: string
  profession?: string
  location?: string
  website?: string
  joined_date: Date
  following: number
  followers: number
  birthday: Date
}
