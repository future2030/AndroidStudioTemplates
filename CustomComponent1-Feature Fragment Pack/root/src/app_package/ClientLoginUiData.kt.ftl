package ${packageName};

import android.os.Parcelable
import kotlinx.android.parcel.Parcelize

@Parcelize
data class ${featurePackPrefix}UiData(var status: Boolean = false) : Parcelable