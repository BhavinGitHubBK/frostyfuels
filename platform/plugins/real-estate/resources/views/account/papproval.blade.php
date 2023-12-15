@extends('core/base::layouts.master')

@section('content')
<div class="card">
    <div class="card-body">

        <table class="table table-striped mb-3">
            <thead>
                <tr>
                    <th>#ID</th>
                    <th>Property Name</th>
                    <th class="text-center">User Name</th>
                    <th class="text-center">Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach($approvalRequests as $approvalRequest)
                
                <tr>
                    <td>
                        {{ $approvalRequest->id  }}
                    </td>
                    <td>
                        {{ $approvalRequest->project->name  }}
                    </td>
                    <td class="text-center">
                        {{ $approvalRequest->account->first_name  }}
                    </td>
                    <td class="text-center">
                        {{ $approvalRequest->is_approved ? 'Approved':'Pending'  }}
                    </td>
                    <td>
                    <a href="{{ route('account.approve', ['id' => $approvalRequest->id]) }}" class="btn btn-success sm">Approve Request</a>
                    </td>
                </tr>
                @endforeach
            </tbody>
      
        </table>
    </div>
    {{ $approvalRequests->links() }}
    </div>
</div>

</div>
@endsection