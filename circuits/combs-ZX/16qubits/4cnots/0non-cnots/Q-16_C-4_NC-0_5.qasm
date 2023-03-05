OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[9];
cx q[10], q[7];
cx q[14], q[6];
cx q[1], q[13];
