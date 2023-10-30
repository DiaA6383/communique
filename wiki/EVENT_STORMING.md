# Propaganda Machine Event Storming

## Domain Events

- **ContentSubmitted**
- **ContentApproved**
- **ContentRejected**
- **VoteReceived**
- **ContentDisplayed**

## Commands

- **SubmitContent**
- **ApproveContent**
- **RejectContent**
- **VoteForContent**
- **DisplayTopContent**

## Aggregates

### Content

- `id`
- `description`
- `data`
- `status`
- `vote_count`

### Vote

- `id`
- `content_id`
- `user_id`

### User

- `id`
- `name`
- `email`
- `role`

## Read Models

- **TopContent**
- **RecentContent**
