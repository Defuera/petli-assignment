# Petli.app assignment

1. Base url is hardcoded, normally would be passed as a config on CI
2. Choice to go with default HTTP client, not retrofit or other library is based on assumption,
such libraries should be chosed based on needs, limitations and other properties of concrete project.
In case of test tasks I prefer not to use excessive libraries if can be omitted
3. Nontheless I choose to use freezed and JsonSerializer, because those are my default instruments I prefer to use most of the time.libraries
4. Usually I use CacheNetworkImage, but this time decided to implement my owl lil placeholder image loading solution based on common flutter widgets - PhotoImage