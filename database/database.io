Table users {
  id bigint [pk]
  username text [not null, unique]
  created_at timestamp [not null]
}

Table places {
  id bigint [pk]
  name text [not null]
}

Table posts {
  id bigint [pk]
  author_id bigint [not null, ref: > users.id]
  place_id bigint [not null, ref: > places.id]
  description text [not null]
  reactions_count int [not null]
  created_at timestamp [not null]

  Indexes {
    author_id
    place_id
    created_at
  }
}

Table post_photos {
  id bigint [pk]
  post_id bigint [not null, ref: > posts.id]
  storage_key text [not null, unique]
  order int [not null]
  created_at timestamp [not null]

  Indexes {
    post_id
  }
}

Table comments {
  id bigint [pk]
  post_id bigint [not null, ref: > posts.id]
  author_id bigint [not null, ref: > users.id]
  text text [not null]
  created_at timestamp [not null]

  Indexes {
    post_id
    author_id
    created_at
  }
}

Table subscriptions {
  follower_id bigint [not null, ref: > users.id]
  followee_id bigint [not null, ref: > users.id]
  created_at timestamp [not null]

  Indexes {
    (follower_id, followee_id) [pk]
    follower_id
    followee_id
  }
}

Table reactions {
  post_id bigint [not null, ref: > posts.id]
  user_id bigint [not null, ref: > users.id]
  created_at timestamp [not null]

  Indexes {
    (post_id, user_id) [pk]
    user_id
    post_id
  }
}