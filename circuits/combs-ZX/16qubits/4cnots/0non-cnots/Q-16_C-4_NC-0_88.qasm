OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[1];
cx q[14], q[3];
cx q[1], q[7];
cx q[1], q[14];
