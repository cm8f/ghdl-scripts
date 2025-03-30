#!/usr/bin/env bash
#
# Called by "nvc --install vunit".
#
# Arguments:
#  $1 = VUnit tag (optional) e.g. v4.6.2

. $(dirname $BASH_SOURCE)/functions.sh

if [ -z "$1" ]; then
    tag="v4.7.0"
fi

git_wrapper https://github.com/VUnit/vunit $tag

for STD in 08; do
  analyse_list osvvm$(std_suffix $STD) <<EOF
vunit/vhdl/osvvm/VendorCovApiPkg.vhd
vunit/vhdl/osvvm/TranscriptPkg.vhd
vunit/vhdl/osvvm/TextUtilPkg.vhd
vunit/vhdl/osvvm/ResolutionPkg.vhd
vunit/vhdl/osvvm/NameStorePkg.vhd
vunit/vhdl/osvvm/NamePkg.vhd
vunit/vhdl/osvvm/OsvvmGlobalPkg.vhd
vunit/vhdl/osvvm/MessageListPkg.vhd
vunit/vhdl/osvvm/AlertLogPkg.vhd
vunit/vhdl/osvvm/TbUtilPkg.vhd
vunit/vhdl/osvvm/SortListPkg_int.vhd
vunit/vhdl/osvvm/ScoreboardGenericPkg.vhd
vunit/vhdl/osvvm/ScoreboardPkg_slv.vhd
vunit/vhdl/osvvm/ScoreboardPkg_int.vhd
vunit/vhdl/osvvm/ResizePkg.vhd
vunit/vhdl/osvvm/RandomBasePkg.vhd
vunit/vhdl/osvvm/RandomProcedurePkg.vhd
vunit/vhdl/osvvm/RandomPkg.vhd
vunit/vhdl/osvvm/MessagePkg.vhd
vunit/vhdl/osvvm/MemoryPkg.vhd
vunit/vhdl/osvvm/CoveragePkg.vhd
vunit/vhdl/osvvm/ReportPkg.vhd
vunit/vhdl/osvvm/OsvvmContext.vhd
EOF
done


for STD in 08; do
  analyse_list vunit_lib$(std_suffix $STD) <<EOF
vunit/vhdl/verification_components/src/axi_pkg.vhd
vunit/vhdl/string_ops/src/string_ops.vhd
vunit/vhdl/path/src/path.vhd
vunit/vhdl/logging/src/print_pkg.vhd
vunit/vhdl/logging/src/location_pkg.vhd
vunit/vhdl/logging/src/location_pkg-body-2008m.vhd
vunit/vhdl/data_types/src/types.vhd
vunit/vhdl/data_types/src/event_common_pkg.vhd
vunit/vhdl/data_types/src/event_private_pkg.vhd
vunit/vhdl/data_types/src/data_types_private_pkg.vhd
vunit/vhdl/data_types/src/codec_builder.vhd
vunit/vhdl/data_types/src/codec_builder-2008p.vhd
vunit/vhdl/data_types/src/codec.vhd
vunit/vhdl/data_types/src/codec-2008p.vhd
vunit/vhdl/data_types/src/api/external_string_pkg.vhd
vunit/vhdl/data_types/src/string_ptr_pkg.vhd
vunit/vhdl/logging/src/ansi_pkg.vhd
vunit/vhdl/logging/src/log_levels_pkg.vhd
vunit/vhdl/data_types/src/string_ptr_pkg-body-2002p.vhd
vunit/vhdl/data_types/src/byte_vector_ptr_pkg.vhd
vunit/vhdl/data_types/src/api/external_integer_vector_pkg.vhd
vunit/vhdl/data_types/src/integer_vector_ptr_pkg.vhd
vunit/vhdl/logging/src/log_handler_pkg.vhd
vunit/vhdl/logging/src/print_pkg-body.vhd
vunit/vhdl/logging/src/file_pkg.vhd
vunit/vhdl/logging/src/log_handler_pkg-body.vhd
vunit/vhdl/data_types/src/integer_vector_ptr_pkg-body-2002p.vhd
vunit/vhdl/data_types/src/integer_array_pkg.vhd
vunit/vhdl/data_types/src/queue_pkg.vhd
vunit/vhdl/data_types/src/string_ptr_pool_pkg.vhd
vunit/vhdl/data_types/src/queue_pkg-body.vhd
vunit/vhdl/data_types/src/queue_pkg-2008p.vhd
vunit/vhdl/data_types/src/integer_vector_ptr_pool_pkg.vhd
vunit/vhdl/verification_components/src/axi_statistics_pkg.vhd
vunit/vhdl/data_types/src/queue_pool_pkg.vhd
vunit/vhdl/data_types/src/integer_array_pkg-body.vhd
vunit/vhdl/data_types/src/dict_pkg.vhd
vunit/vhdl/data_types/src/dict_pkg-2008p.vhd
vunit/vhdl/data_types/src/dict_pkg-body.vhd
vunit/vhdl/data_types/src/data_types_context.vhd
vunit/vhdl/core/src/stop_pkg.vhd
vunit/vhdl/core/src/stop_body_2008p.vhd
vunit/vhdl/core/src/core_pkg.vhd
vunit/vhdl/logging/src/log_levels_pkg-body.vhd
vunit/vhdl/data_types/src/id_pkg.vhd
vunit/vhdl/logging/src/logger_pkg.vhd
vunit/vhdl/verification_components/src/memory_pkg.vhd
vunit/vhdl/verification_components/src/memory_utils_pkg.vhd
vunit/vhdl/verification_components/src/memory_pkg-body.vhd
vunit/vhdl/logging/src/log_deprecated_pkg.vhd
vunit/vhdl/dictionary/src/dictionary.vhd
vunit/vhdl/run/src/run_types.vhd
vunit/vhdl/run/src/runner_pkg.vhd
vunit/vhdl/run/src/run_api.vhd
vunit/vhdl/logging/src/logger_pkg-body.vhd
vunit/vhdl/data_types/src/event_pkg.vhd
vunit/vhdl/com/src/com_types.vhd
vunit/vhdl/com/src/com_api.vhd
vunit/vhdl/check/src/checker_pkg.vhd
vunit/vhdl/run/src/run_deprecated_pkg.vhd
vunit/vhdl/vunit_run_context.vhd
vunit/vhdl/run/src/run.vhd
vunit/vhdl/check/src/checker_pkg-body.vhd
vunit/vhdl/check/src/check_api.vhd
vunit/vhdl/check/src/check_deprecated_pkg.vhd
vunit/vhdl/vunit_context.vhd
vunit/vhdl/random/src/random_pkg.vhd
vunit/vhdl/com/src/com_support.vhd
vunit/vhdl/com/src/com_messenger.vhd
vunit/vhdl/com/src/com_common.vhd
vunit/vhdl/com/src/com_deprecated.vhd
vunit/vhdl/com/src/com_debug_codec_builder.vhd
vunit/vhdl/com/src/com_string.vhd
vunit/vhdl/com/src/com_context.vhd
vunit/vhdl/verification_components/src/wishbone_pkg.vhd
vunit/vhdl/verification_components/src/wishbone_slave.vhd
vunit/vhdl/verification_components/src/sync_pkg.vhd
vunit/vhdl/verification_components/src/sync_pkg-body.vhd
vunit/vhdl/verification_components/src/stream_slave_pkg.vhd
vunit/vhdl/verification_components/src/stream_slave_pkg-body.vhd
vunit/vhdl/verification_components/src/stream_master_pkg.vhd
vunit/vhdl/verification_components/src/uart_pkg.vhd
vunit/vhdl/verification_components/src/uart_slave.vhd
vunit/vhdl/verification_components/src/uart_master.vhd
vunit/vhdl/verification_components/src/stream_master_pkg-body.vhd
vunit/vhdl/verification_components/src/signal_checker_pkg.vhd
vunit/vhdl/verification_components/src/std_logic_checker.vhd
vunit/vhdl/verification_components/src/bus_master_pkg.vhd
vunit/vhdl/verification_components/src/wishbone_master.vhd
vunit/vhdl/verification_components/src/ram_master.vhd
vunit/vhdl/verification_components/src/bus_master_pkg-body.vhd
vunit/vhdl/verification_components/src/bus2memory.vhd
vunit/vhdl/verification_components/src/axi_stream_pkg.vhd
vunit/vhdl/verification_components/src/axi_stream_protocol_checker.vhd
vunit/vhdl/verification_components/src/axi_stream_private_pkg.vhd
vunit/vhdl/verification_components/src/axi_stream_monitor.vhd
vunit/vhdl/verification_components/src/axi_stream_slave.vhd
vunit/vhdl/verification_components/src/axi_stream_master.vhd
vunit/vhdl/verification_components/src/axi_slave_pkg.vhd
vunit/vhdl/verification_components/src/axi_lite_master_pkg.vhd
vunit/vhdl/verification_components/src/avalon_stream_pkg.vhd
vunit/vhdl/verification_components/src/avalon_source.vhd
vunit/vhdl/verification_components/src/avalon_sink.vhd
vunit/vhdl/verification_components/src/avalon_pkg.vhd
vunit/vhdl/verification_components/src/vc_context.vhd
vunit/vhdl/verification_components/src/axi_slave_private_pkg.vhd
vunit/vhdl/verification_components/src/axi_write_slave.vhd
vunit/vhdl/verification_components/src/axi_lite_master.vhd
vunit/vhdl/verification_components/src/axi_read_slave.vhd
vunit/vhdl/verification_components/src/avalon_slave.vhd
vunit/vhdl/verification_components/src/avalon_master.vhd
vunit/vhdl/com/src/com.vhd
vunit/vhdl/check/src/check.vhd
EOF
done
