# Petli.app assignment


### Task
Create the following Flutter app:
A) Create Infinite scroll list with images ( use https://jsonplaceholder.typicode.com photos as API source)
B) Each image in the list has a Title, an image Preview and a Like button
C) By tapping on a Preview image user is shown a full-sized Image in a popup
D) User can like and unlike Images by tapping Like button
E) Like state persist between app launches

### Notice
- Nice fade animations 😅
- Usage of either/option along with my own extensions, I find it quite a clear and concise approach for  error propagation:)
- Choice to go with default HTTP client, not retrofit or other library is based on assumption,
such libraries should be chosen based on needs, limitations and other properties of concrete project.
In case of test tasks I prefer not to use excessive libraries if can be omitted
- Nonetheless I choose to use freezed and JsonSerializer, because those are my default instruments I prefer to use most of the time.libraries


### Known flaws
1. Base url is hardcoded, normally would be passed as a config on CI
1. Handling error on like press (we want to be ready to make it online functionality)
1. Navigation could be done better, but it takes time to structure it properly and write services, so I omitted it here.
1. The way of updating like on list page after getting back from detailed is terrible, but it works. 🤷

### Demonstration



https://user-images.githubusercontent.com/1181883/145787343-60e30e99-0af7-4e83-b706-9b2b4ca77e5d.mp4

