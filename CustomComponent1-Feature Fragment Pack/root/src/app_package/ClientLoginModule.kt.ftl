package ${packageName};

import androidx.lifecycle.ViewModel
import dagger.Binds
import dagger.Module
import dagger.android.ContributesAndroidInjector
import dagger.multibindings.IntoMap
import ${basePackageName}.di.fragment.FragmentScoped
import ${basePackageName}.di.viewmodel.ViewModelKey

@Module
@Suppress("UNUSED")
internal abstract class ${featurePackPrefix}Module {

    @FragmentScoped
    @ContributesAndroidInjector
    abstract fun contributeFragment(): ${featurePackPrefix}Fragment


    @Binds
    @IntoMap
    @ViewModelKey(${featurePackPrefix}ViewModel::class)
    abstract fun bindFragmentViewModel(viewModel: ${featurePackPrefix}ViewModel): ViewModel
}