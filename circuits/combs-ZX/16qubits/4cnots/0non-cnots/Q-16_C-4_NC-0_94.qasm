OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[13];
cx q[6], q[14];
cx q[4], q[0];
cx q[6], q[7];
