package ${packageName};

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.viewModels
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.navigation.fragment.findNavController
import ${basePackageName}.R
import ${basePackageName}.ui.launch.LaunchSimpleDestination
import ${basePackageName}.ui.main.BaseFragment
import ${basePackageName}.ui.main.MainActivity
import ${basePackageName}.util.EventObserver
import ${basePackageName}.util.showSnackbar
import kotlinx.android.synthetic.main.fragment_${camelCaseToUnderscore(featurePackPrefix)}.*
import javax.inject.Inject

class ${featurePackPrefix}Fragment : BaseFragment() {
    @Inject
    lateinit var viewModelFactory: ViewModelProvider.Factory
    private val viewModel by viewModels<${featurePackPrefix}ViewModel> { viewModelFactory }

    //inflate your view here
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_${camelCaseToUnderscore(featurePackPrefix)}, container, false)
    }

    //Initialize your view here
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        observeLiveData()
        viewModel.start(${featurePackPrefix}UiData())

    }

    private fun observeLiveData() {

        viewModel.launchSimpleDestinations.observe(this, EventObserver {
            //open destinations here
            if (it == LaunchSimpleDestination.MAIN_ACTIVITY) {
                //launch only if the activity is not null
                if (activity != null) {
                    startActivity(MainActivity.newIntent(activity!!))
                    activity!!.finish()
                }

            }
        })

     

        viewModel.snackbarMessageResRes.observe(this, EventObserver {
            coordinator.showSnackbar(it.messageId) {}
        })
        viewModel.snackbarText.observe(this, EventObserver {
            coordinator.showSnackbar(it.message) {}
        })

        //TODO:rename the request variable name
        viewModel.loginRequestLoading.observe(this, Observer {

            val request = it.getContentIfNotHandled()
            if (request != null && request) {
                showLoadingBar()
            } else {
                hideLoadingBar()
            }

        })

       



    }

    private fun hideLoadingBar() {

        loginButton.visibility = View.VISIBLE
        progressBar.visibility = View.GONE


    }


    private fun showLoadingBar() {
        loginButton.visibility = View.GONE
        progressBar.visibility = View.VISIBLE


    }

}