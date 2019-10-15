package ${packageName};

import androidx.lifecycle.LiveData
import androidx.lifecycle.MediatorLiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Transformations
import ${basePackageName}.repo.DataRepository
import ${basePackageName}.repo.db.model.login.Bar
import ${basePackageName}.ui.launch.LaunchSimpleDestination
import ${basePackageName}.ui.main.BaseViewModel
import ${basePackageName}.ui.model.SnackbarMessageRes
import ${basePackageName}.ui.model.SnackbarMessageTxt
import ${basePackageName}.util.Event
import javax.inject.Inject

class ${featurePackPrefix}ViewModel @Inject constructor(
    private val dataRepository: DataRepository
) : BaseViewModel() {

    //saves all data related to the UI.
    private lateinit var uiData: ${featurePackPrefix}UiData

    //---------- begin: internal events
    private val _initViewModel = MutableLiveData<Int>()
    private val _loginRequest = MutableLiveData<Int>()

    //---------- end: internal events

    //---------- begin: UI controllers --------
    //start new destinations when required
    private val _launchSimpleDestinations = MutableLiveData<Event<LaunchSimpleDestination>>()
    val launchSimpleDestinations: LiveData<Event<LaunchSimpleDestination>>
        get() = _launchSimpleDestinations


    //used for snackbar messages with string resource ID
    private val _snackbarTextRes = MediatorLiveData<Event<SnackbarMessageRes>>()
    val snackbarMessageResRes: LiveData<Event<SnackbarMessageRes>> = _snackbarTextRes

    //used for snackbar messages
    private val _snackbarText = MutableLiveData<Event<SnackbarMessageTxt>>()
    val snackbarText: LiveData<Event<SnackbarMessageTxt>> = _snackbarText


    //show a blocking loading indicator when we do some transactional operation
    private val _loginRequestLoading = MutableLiveData<Event<Boolean>>()
    val loginRequestLoading: LiveData<Event<Boolean>> = _loginRequestLoading


    //----------- end: UI controllers -------------


    init {
      
        val firstEvent = Transformations.switchMap(_initViewModel) {
            _loginRequestLoading.value = Event(content = true)
           // dataRepository.login("username","password")
        }
        

    }


    //this method will be called from the UI component to start the ViewModel
    fun start(uiData: ${featurePackPrefix}UiData) {
        this.uiData = uiData
        //Init the UI
        _initViewModel.value = REQUEST_FETCH_DATA


    }

    companion object {
        //use this constant when ever you want to request data using a mutable live data
        const val REQUEST_FETCH_DATA = 1

    }


}